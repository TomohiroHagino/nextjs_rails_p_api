class EcsSkill < ApplicationRecord
  belongs_to :me
  scope :myself_ecs_skills, EcsSkills::MyselfEcsSkillsQuery
end
