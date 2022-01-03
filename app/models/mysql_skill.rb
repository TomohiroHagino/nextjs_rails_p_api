class MysqlSkill < ApplicationRecord
  belongs_to :me
  scope :myself_mysql_skills, MysqlSkills::MyselfMysqlSkillsQuery
end
