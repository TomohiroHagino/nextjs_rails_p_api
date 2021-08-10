class RailsSkill < ApplicationRecord
  belongs_to :me
  scope :myself_rails_skills, RailsSkills::MyselfRailsSkillsQuery
end
