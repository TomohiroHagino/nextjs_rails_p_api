module EcsSkills
  class MyselfEcsSkillsQuery < Query
    def initialize(relation = EcsSkill.all)
      @relation = relation
    end

    def call
      @relation.eager_load(:me).
                where(ecs_skills: {deleted: false}).
                where(mes: {id: Rails.application.credentials.me})
    end
  end
end