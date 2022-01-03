class Ec2Skill < ApplicationRecord
  belongs_to :me
  scope :myself_ec2_skills, Ec2Skills::MyselfEc2SkillsQuery
end
