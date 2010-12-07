/* chat objects */

//var chat_windows = new Array();
var nb_win = 0;

function find_session_with(person_id) {
  new Ajax.Request("/chat/find_session_with?id="+person_id, {
    onSuccess: function(r) {
      var session_id = r.responseText;
      if(session_id=="") {
        create_chat_window(person_id);
        }
      else {
        open_chat_window(session_id, person_id);
        }
      }
    });
  }

function open_chat_window(id, person_id) {
  var win = $('chat_window_'+id);
  if(win) {
    win.show();
    scroll_down(id);
    chat_sessions_refresh();
    }
  else {
    create_chat_window(person_id);
    }
  }

function create_chat_window(person_id) {
  new Ajax.Request("/chat/create_new_session?id="+person_id, {
    onSuccess: function(r) {
      var s = r.responseText.split('||##||')
      show(s[0], s[1]);
      }
    });
  }

function close_chat_window(session_id, person_id) {
  nb_win -= 1;
  new Effect.Fade('chat_window_'+session_id, {duration:0.2});
  new Ajax.Request("/chat/set_read?session_id="+session_id+"&person_id="+person_id);
  }

function toggle_chat_window(session_id, person_id) {
  new Effect.toggle('chat_msg_and_input_'+session_id, 'blind', {duration:0.2});
  
  // set messages status to read
  $('chat_participants_'+session_id).className = 'participants';
  new Ajax.Request("/chat/set_read?session_id="+session_id+"&person_id="+person_id);
  scroll_down(session_id);
 }

function chat_refresh() {
  new Ajax.Updater("chat_list", "/chat/refresh");
  var delay = 1*60*1000;
  setTimeout("chat_refresh()", delay);
  }

function get_position() {
  return (((((nb_win-1) % 5))+1) * 205) + "px";
  }

// the chat window does not exust in the DOM yet
function show(id, content) {
  nb_win += 1;
  var windows = $('chat_windows');

  // FIX ME: just remove me after testing
  var win = $('chat_window_'+id);
  if(win) {
    alert('Error: chat window already exists');
    windows.removeChild(win); // should never happen
    }
  // END

  windows.insert(content);
  scroll_down(id);
  //$('chat_input_'+id).focus();
  win = $('chat_window_'+id);
  win.style.top = (Math.ceil((nb_win/5))*30)+"px";
  win.style.right = get_position();
  new Draggable(win);
  }

// the chat window is created in the DOM already
function refresh_msg(id, content) {
  // if window is hidden
  var win = $('chat_window_'+id);
  win.show();
  // if window is collapsed
  if($('chat_msg_and_input_'+id).style.display=='none')
    $('chat_participants_'+id).className = 'participants unread';
  // change messages
  update_content(id, content);
  }

function chat_sessions_refresh() {
    new Ajax.Request("/chat/refresh_sessions", {
      onSuccess: function(r) {
        if(r.responseText == "") return;
        var array = r.responseText.split('||sessions||');
        var s, w;
        for(var i=0; i < array.length; i++) {
          s = array[i].split('||##||')
          w = $('chat_window_'+s[0]);
          if(w) {
            refresh_msg(s[0], s[1].split("<!--MESSAGES-->")[1].split("<!--END_MESSAGES-->")[0]);
            }
          else {
            show(s[0], s[1]);
            }
          }
        }
      });
    // TODO: if last message is recent set it shorter
    var delay = 10*1000;
    setTimeout("chat_sessions_refresh()", delay);
    }

setTimeout("chat_refresh()", 1*60*1000);
setTimeout("chat_sessions_refresh()", 1*1000);

function chat_keydown(e, id) {
  if(!e) e = window.event;
  if(e.keyCode != 13) return true;

  chat_send_msg(id);
  return false;
  }

function chat_send_msg(id) {
  inp = $('chat_input_'+id);
  msg = inp.value;
  new Ajax.Request("/chat/send_chat_msg?id="+id+"&msg="+msg);
  update_content(id, "<li><b>Moi</b><br/>&nbsp;"+msg+"</li>");
  inp.value = "";
  chat_sessions_refresh();
  return false;
  }

function scroll_down(id) {  
  var m = $('chat_msg_'+id);
  m.scrollTop = m.scrollHeight;
  }

function update_conten(id, content) {  
  var m = $('chat_msg_'+id);
  m.innerHTML += content;
  m.scrollTop = m.scrollHeight;
  //$('chat_input_'+id).focus();
  }
  
function chat_onfocus(session_id, person_id) {
  new Ajax.Request("/chat/set_read?session_id="+session_id+"&person_id="+person_id);
  }