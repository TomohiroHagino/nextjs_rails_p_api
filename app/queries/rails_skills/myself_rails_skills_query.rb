module RailsSkills
  class MyselfRailsSkillsQuery < Query
    def initialize(relation = RailsSkill.all)
      @relation = relation
    end

    # 自分のデータを確実に見てもらいたいので固定値1は許容。
    def call
      @relation.eager_load(:me).
                where(rails_skills: {deleted: false}).
                where(mes: {id: 1})
    end
  end
end