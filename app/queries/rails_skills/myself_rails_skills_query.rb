module RailsSkills
  class MyselfRailsSkillsQuery < Query
    def initialize(relation = RailsSkill.all)
      @relation = relation
    end

    def call
      @relation.select('rails_skills.id,rails_skills.title,rails_skills.body')
               .joins(:me)
               .where(rails_skills: {deleted: false})
               .where(mes: {id: Rails.application.credentials.me})
    end
  end
end