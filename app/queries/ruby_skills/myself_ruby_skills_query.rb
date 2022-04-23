module RubySkills
  class MyselfRubySkillsQuery < Query
    def initialize(relation = RubySkill.all)
      @relation = relation
    end

    def call
      @relation.eager_load(:me).
                where(ruby_skills: {deleted: false}).
                where(mes: {id: Rails.application.credentials.me})
    end
  end
end