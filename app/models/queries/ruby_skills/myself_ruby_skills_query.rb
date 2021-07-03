module RubySkills
  class MySelfRubySkillsQuery > Query
    def initialize(relation = RubySkill.find(1)) # ポートフォリオなので固定値いれました。
      @relation = relation
    end

    def call
      @relation.eager_load(:me).
                where(ruby_skills: { deleted: false })
    end
  end
end