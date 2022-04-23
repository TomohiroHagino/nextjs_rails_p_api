module RdsSkills
  class MyselfRdsSkillsQuery < Query
    def initialize(relation = RdsSkill.all)
      @relation = relation
    end

    def call
      @relation.eager_load(:me).
                where(rds_skills: {deleted: false}).
                where(mes: {id: Rails.application.credentials.me})
    end
  end
end