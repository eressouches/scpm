class WelcomeController < ApplicationController

  def index
    @report = Report.new(Request.all)
    @last = Request.find(:all, :limit=>5, :order=>"updated_at desc")
    @sdp_mfm = Request.find(:all, :conditions=>["sdp='No' and start_date < ? and resolution='in progress' and workstream in ('EDS','EDG','EI','EM','EDC')", Date.today()+8], :order=>"start_date")
    @sdp_dam = Request.find(:all, :conditions=>["sdp='No' and start_date < ? and resolution='in progress' and workstream in ('EDY','EA','EV', 'EDE')", Date.today()+8], :order=>"start_date")
    @not_assigned_mfm = Request.find(:all, :conditions=>["status!='assigned' and status!='cancelled' and start_date < ? and workstream in ('EDS','EDG','EI','EM','EDC')", Date.today()+15], :order=>"start_date")
    @not_assigned_dam = Request.find(:all, :conditions=>["status!='assigned' and status!='cancelled' and start_date < ? and workstream in ('EDY','EA','EV', 'EDE')", Date.today()+15], :order=>"start_date")
    @null_start_date  = Request.find(:all, :conditions=>["start_date = '' and status != 'cancelled'"], :order=>"start_date")
    @null_milestones  = Request.find(:all, :conditions=>["milestone_date = '' and status != 'cancelled' and resolution='in progress'"], :order=>"start_date")
    @past_milestones  = Request.find(:all, :conditions=>["milestone_date != '' and milestone_date < ? and resolution!='ended'", Date.today()], :order=>"milestone_date")
    @not_performed    = Request.find(:all, :conditions=>["resolution='ended' and status!='performed' and status!='closed' and status!='cancelled'", Date.today()], :order=>"milestone_date")
    @sdp_cancelled    = Request.find(:all, :conditions=>["sdp='Yes' and status='cancelled'", Date.today()], :order=>"milestone_date")
  end

  def upload
    post = params[:upload]
    name =  post['datafile'].original_filename
    directory = "public/data"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(post['datafile'].read) }
    report = CvsReport.new(path)
    report.parse
    # transform the Report into a Request
      report.requests.each { |req|
        # get the id if it exist, else create it
        r = Request.find_by_request_id(req.id)
        r = Request.create(:request_id=>req.id) if not r
        r.update_attributes(req.to_hash) # and it updates only the attributes that have changed !
        r.save
        }
    redirect_to :action=>:index
  end
  
  def workload_schedule
    @requests = Request.find(:all, :conditions=>["status!='feedback' and status!='cancelled'"]).sort_by { |r| r.gantt_start_date}
    @resources = @requests.collect { |r| r.assigned_to}.uniq.sort
    response.headers['Content-Type'] = 'text/xml'
    response.headers['Content-Disposition'] = 'attachment; filename=workload.gan'
    render(:layout=>false)
  end

private

=begin
  def init
    @report = CvsReport.new('/home/mick/DL/mfaivremacon.csv')
    #@report = Report.new('D:\DL\mfaivremacon.csv')
    @report.parse
  end  
=end

end
