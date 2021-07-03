module RailsSkills
  class MySelfRailsSkillsQuery > Query
    def initialize(relation = RailsSkill.find(1)) # ポートフォリオなので固定値いれました。
      @relation = relation
    end

    def call
      @relation.eager_load(:me).
                where(rails_skills: { deleted: false })
    end
  end
end