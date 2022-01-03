class RdsSkill < ApplicationRecord
  belongs_to :me
  scope :myself_rds_skills, RdsSkills::MyselfRdsSkillsQuery
end
