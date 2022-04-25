module MysqlSkills
  class MyselfMysqlSkillsQuery < Query
    def initialize(relation = MysqlSkill.all)
      @relation = relation
    end

    def call
      @relation.select('mysql_skills.id,mysql_skills.title,mysql_skills.body')
               .joins(:me)
               .where(mysql_skills: {deleted: false})
               .where(mes: {id: Rails.application.credentials.me})
    end
  end
end