module RubySkills
  class MyselfRubySkillsQuery < Query
    def initialize(relation = RubySkill.all)
      @relation = relation
    end

    # 今回の固定値1は許容しました。
    def call
      @relation.eager_load(:me).
                where(ruby_skills: {deleted: false}).
                where(mes: {id: 1})
    end
  end
end