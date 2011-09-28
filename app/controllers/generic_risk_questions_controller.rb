class GenericRiskQuestionsController < ApplicationController

  layout 'tools'

  def index
    @questions = GenericRiskQuestion.all
  end

  def new
    @question = GenericRiskQuestion.new
    get_milestones
  end

  def create
    @question = GenericRiskQuestion.new(params[:question])
    if not @question.save
      render :action => 'new'
      return
    end
    redirect_to("/generic_risk_questions")
  end

  def edit
    id = params[:id]
    @question = GenericRiskQuestion.find(id)
    get_milestones
  end

  def get_milestones
    @milestone_names = MilestoneName.find(:all).select{|m| ['M3','M5','G2','G5'].include?(m.title)}.map{|m| [m.title, m.id]}
    @capi_axes = CapiAxis.find(:all).map{|m| [m.name, m.id]}
  end

  def update
    q = GenericRiskQuestion.find(params[:id])
    q.update_attributes(params[:question])
    redirect_to "/generic_risk_questions"
  end

  def destroy
    GenericRiskQuestion.find(params[:id].to_i).destroy
    render(:nothing=>true)
  end

  def run
    @project = Project.find(params[:id])
    @questions = GenericRiskQuestion.find(:all, :conditions=>"deployed='1'")
    render(:layout=>'general')
  end

  def import
    questions = params['question']
    risks     = params['r']
    project_id = params[:id].to_i
    questions.each do |index, answer|
      next if answer=="yes"
      next if !risks[index]
      next if risks[index][:probability] == "0"
      next if Risk.find(:first, :conditions=>["project_id=? and generic_risk_id=?", project_id, risks[index][:id]])
      Risk.create(:project_id=>project_id,
        :generic_risk_id=>risks[index][:id],
        :context=>risks[index][:context],
        :risk=>risks[index][:risk],
        :probability=>risks[index][:probability],
        :consequence=>risks[index][:consequence],
        :impact=>risks[index][:impact],
        :actions=>risks[index][:actions])
    end
    redirect_to :controller=>'projects', :action=>'show', :id=>project_id
  end

  def deploy
    id = params[:id]
    value = params[:value].to_i
    q = GenericRiskQuestion.find(id)
    q.update_attribute('deployed',value)
    render(:partial=>"question", :locals=>{:q=>q})
  end

end

