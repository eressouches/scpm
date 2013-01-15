module SdpDB

  PhaseDB = { # name => [phase_id, proposal_id]
	  'Bundle Management'        =>[32329,31245],
	  'Continuous Improvement'   =>[32331,31375],
	  'Quality Assurance'        =>[32330,31376],
	  'WP1.1 - Quality Control'  =>[32317,31244],
	  'WP1.2 - Quality Assurance'=>[32318,31244],
    'WP1.3 - Quality Control + BAT'=>[32319,31244],
    'WP1.4 - Quality Assurance + BAT'=>[29634,31244], # Not used anymore
    'WP1.4 - Agility'          =>[32488,31244], #NEW
    'WP1.5 - SQR'              =>[32497,31244], #NEW
    'WP1.6.1 - DWQAP'          =>[32498,31244], #NEW
    'WP1.6.2 - Project Setting-up' =>[32498,31244], #NEW
    'WP1.6.3 - Support, Reporting & KP' =>[32498,31244], #NEW
    'WP1.6.4 – Quality Status'          =>[32498,31244], #NEW
    'WP1.6.5 – Spiders'                 =>[32498,31244], #NEW
    'WP1.6.6 – QG BRD'                  =>[32498,31244], #NEW
    'WP1.6.7 – QG TD'                   =>[32498,31244], #NEW
    'WP1.6.8 – Lessons Learnt'          =>[32498,31244], #NEW
	  'WP2 - Quality for Maintenance'=>[32320,31246], # WP2 - Maintenance
    'WP3.0 - Old Modeling'            => [32321,31247],
    'WP3.1 - Modeling Support'        => [32321,31247],
    'WP3.2 - Modeling Conception and Production' => [32321,31247],
    'WP3.2.1 - Business Process Layout'          => [32321,31247], #NEW
    'WP3.2.2 - Functional Layout (Use Cases)'    => [32321,31247], #NEW
    'WP3.2.3 - Information Layout (Data Model)'  => [32321,31247], #NEW
    'WP3.3 - Modeling BAT specific Control'      => [32321,31247],
    'WP3.4 - Modeling BAT specific Production'   => [32321,31247],
	  'WP3 - Modeling'=>[32321,31247],
	  'WP4.1 - Surveillance Audit'=>[32322,31248], # does not exist in SDP (just WP4)
	  'WP4.2 - Surveillance Root cause'=>[32322,31248],
	  'WP4.3 - Actions Implementation & Control'   => [32322,31248], #NEW
	  'WP5 - Change Accompaniment'=>[32323,31249],
	  'WP5.1 - Change: Diagnosis & Action Plan'    => [32323,31249], #NEW
	  'WP5.2 – Change : Implementation Support & Follow-up' => [32323,31249], #NEW
	  'WP6.1 - Coaching PP'=>[32324,31250],     #WP6.1 - Coaching for Project setting-up
	  'WP6.2 - Coaching BRD'=>[32325,31250],    #WP6.2 - Coaching for Business Requirements
	  'WP6.3 - Coaching V&V'=>[32326,31250],    #WP6.3 - Coaching for Verification and Validation
	  'WP6.4 - Coaching ConfMgt'=>[32327,31250],  #WP6.4 - Coaching for Configuration Management
	  'WP6.5 - Coaching Maintenance'=>[32328,31250]   #WP6.5 - Coaching for Maintenance
	  "WP6.6 – Change : Implementation Support & Follow-up" => [32499,31250], #NEW
	  "WP6.7 – Coaching Business Process"                   => [32500,31250], #NEW
	  "WP6.8 – Coaching Use Case"                           => [32501,31250], #NEW
	  "WP6.9 – Coaching Data Model"                         => [32502,31250], #NEW
	  "WP6.10.1 – Diagnosis & project launch"               => [0,31250], #NEW
	  "WP6.10.2 – Sprint 0 support"                         => [0,31250], #NEW
	  "WP6.10.3 – Sprint coaching"                          => [0,31250], #NEW
	  "WP7.1.1 – Requirements Management"                   => [32489,31568], #NEW
	  "WP7.1.2 – Risks Management"                          => [32489,31568], #NEW
	  "WP7.1.3 – Test Management"                           => [32489,31568], #NEW
	  "WP7.1.4 – Change Management"                         => [32489,31568], #NEW
	  "WP7.1.5 – Lessons Learnt"                            => [32489,31568], #NEW
	  "WP7.1.6 – Configuration Management"                  => [32489,31568], #NEW
	  "WP7.2.1 – Requirements Management"                   => [32504,31568], #NEW
	  "WP7.2.2 – Risks Management"                          => [32504,31568], #NEW
	  "WP7.2.3 – Test Management"                           => [32504,31568], #NEW
	  "WP7.2.4 – Change Management"                         => [32504,31568], #NEW
	  "WP7.2.5 – Lessons Learnt"                            => [32504,31568], #NEW
	  "WP7.2.6 – Configuration Management"                  => [32504,31568]  #NEW
	  }



    ActivityDB = {
      ['All','WP3.0 - Old Modeling']=>142226,
      ['All','WP3.1 - Modeling Support']=>142226,
      ['All','WP3.2 - Modeling Conception and Production']=>142226,
      ['All','WP3.3 - Modeling BAT specific Control']=>142226,
      ['All','WP3.4 - Modeling BAT specific Production']=>142226,
      ['All','WP3 - Modeling']=>142226,
      ['All','WP4.1 - Surveillance Audit']=>142227,
      ['All','WP4.2 - Surveillance Root cause']=>142228,
      ['All','WP5 - Change Accompaniment']=>142230,
      ['All','WP6.1 - Coaching PP']=>142231,
      ['All','WP6.2 - Coaching BRD']=>142232,
      ['All','WP6.3 - Coaching V&V']=>142233,
      ['All','WP6.4 - Coaching ConfMgt']=>142234,
      ['All','WP6.5 - Coaching Maintenance']=>142235,
      ['All','WP2 - Quality for Maintenance']=>142225,
      #['Audit',nil]=>127637,
      ['Bundle Management','']=>142237,
      ['Bundle Quality Assurance','']=>142236,
      ['Continuous Improvement','']=>142238,
      #['Hand-Over','']=>102845,
      #['Initialization','']=>102844,
      ['M1-M3','WP1.2 - Quality Assurance']=>142221,
      ['M1-M3','WP1.1 - Quality Control']=>142217,
      ['M3-M5','WP1.1 - Quality Control']=>142218,
      ['M3-M5','WP1.2 - Quality Assurance']=>142222,
      ['M5-M10','WP1.1 - Quality Control']=>142219,
      ['M5-M10','WP1.2 - Quality Assurance']=>142223,
      ['Montée en compétences',nil]=>142240,
      ['Operational Management',nil]=>142239,
      ['Post-M10','WP1.2 - Quality Assurance']=>142224,
      ['Post-M10','WP1.1 - Quality Control']=>142220,
      ['Processes Evaluation',nil]=>142229,
      ['Root Causes Analysis',nil]=>142228,
      ['Sous charges',nil]=>142241
      }

  # SDP Doamin
  DomainDB = {
      #'EA'  =>2865,
      'EV'  =>3734,
      'EE'  =>3733,
      'EY'  =>3736,
      'EG'  =>3743,
      'ES'  =>3735,
      'EZ'  =>3737,
      'EI'  =>3739,
      'EZC' =>3738,
      'EZMC'=>3740,
      'EZMB'=>3741,
      'TBCE'=>3742
      }

  def self.sdp_phase_id(name)
    rv = PhaseDB[name]
    raise "SDPPhase '#{name}' unknown" if not rv
    rv[0]
  end

  def self.sdp_proposal_id(name)
    rv = PhaseDB[name]
    raise "Proposal '#{name}' unknown" if not rv
    rv[1]
  end

  def self.sdp_domain_id(name)
    rv = DomainDB[name]
    raise "Domain '#{name}' unknown" if not rv
    rv
  end

  def self.sdp_activity_id(arr)
    rv = ActivityDB[[arr[0],nil]]
    rv = ActivityDB[arr] if not rv
    raise "SDPActivity '[#{arr.join(',')}]' unknown" if not rv
    rv
  end

end

