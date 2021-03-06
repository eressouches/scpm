class Action < ActiveRecord::Base

  belongs_to :person
  belongs_to :project
  belongs_to :origin, :class_name=>"Person", :foreign_key=>'origin_id'

  before_save :track_changes

  def person_name
    return person.name if person
    ""
  end

  def project_full_name
    return project.full_name if project
    ""
  end

private

  def track_changes
    return if self.id == nil or self.project_id_was == nil
    was_p = Project.find(self.project_id_was)
    if was_p
      self.result = (self.result ? self.result : "") + " changed from project #{self.project_id_was}, #{was_p.name}" if self.project_id_changed? and self.project_id_was
    else
      self.result = (self.result ? self.result : "") + " changed from project #{self.project_id_was}, deleted" if self.project_id_changed? and self.project_id_was
    end
  end

end
