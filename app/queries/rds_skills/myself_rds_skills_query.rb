module RdsSkills
  class MyselfRdsSkillsQuery < Query
    def initialize(relation = RdsSkill.all)
      @relation = relation
    end

    # 今回の固定値1は許容しました。
    def call
      @relation.eager_load(:me).
                where(rds_skills: {deleted: false}).
                where(mes: {id: 1})
    end
  end
end