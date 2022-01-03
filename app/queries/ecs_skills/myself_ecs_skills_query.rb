module EcsSkills
  class MyselfEcsSkillsQuery < Query
    def initialize(relation = EcsSkill.all)
      @relation = relation
    end

    # 今回の固定値1は許容しました。
    def call
      @relation.eager_load(:me).
                where(ecs_skills: {deleted: false}).
                where(mes: {id: 1})
    end
  end
end