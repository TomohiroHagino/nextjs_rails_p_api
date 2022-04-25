module RubySkills
  class MyselfRubySkillsQuery < Query
    def initialize(relation = RubySkill.all)
      @relation = relation
    end

    def call
      @relation.select('ruby_skills.id,ruby_skills.title,ruby_skills.body')
               .joins(:me)
               .where(ruby_skills: {deleted: false})
               .where(mes: {id: Rails.application.credentials.me})
    end
  end
end