module MysqlSkills
  class MyselfMysqlSkillsQuery < Query
    def initialize(relation = MysqlSkill.all)
      @relation = relation
    end

    def call
      @relation.eager_load(:me).
                where(mysql_skills: {deleted: false}).
                where(mes: {id: Rails.application.credentials.me})
    end
  end
end