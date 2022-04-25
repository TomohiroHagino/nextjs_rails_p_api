class Me < ApplicationRecord
  has_many :ruby_skills
  has_many :rails_skills
  has_many :react_skills
  has_many :next_js_skills
  has_many :react_skills
  has_many :mysql_skills
  has_many :s3_skills
  has_many :ec2_skills
  has_many :ecs_skills
  has_many :rds_skills

  scope :myself_react_and_next_js_skills, Mes::MyselfReactAndNextJsSkillsQuery
  scope :search_myself, Mes::SearchMyselfQuery
end
