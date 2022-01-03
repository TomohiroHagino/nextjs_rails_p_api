class S3Skill < ApplicationRecord
  belongs_to :me
  scope :myself_s3_skills, S3Skills::MyselfS3SkillsQuery
end
