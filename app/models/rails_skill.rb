class RailsSkill < ApplicationRecord
  belongs_to :me
  scope :myself_rails_skills, RailsSklls::MySelfRailsSkillsQuery
  scope :update_deleted, boolean -> { Commons::UpdateDeletedQuery({class_name: "RailsSkill", boolean: boolean}) }
end
