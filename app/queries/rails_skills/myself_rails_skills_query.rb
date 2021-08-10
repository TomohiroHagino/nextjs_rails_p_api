module RailsSkills
  class MyselfRailsSkillsQuery < Query
    def initialize(relation = RailsSkill.all)
      @relation = relation
    end

    # 今回の固定値1は許容しました。
    def call
      @relation.eager_load(:me).
                where(rails_skills: {deleted: false}).
                where(mes: {id: 1})
    end
  end
end