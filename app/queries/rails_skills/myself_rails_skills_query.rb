module RailsSkills
  class MyselfRailsSkillsQuery < Query
    def initialize(relation = RailsSkill.all)
      @relation = relation
    end

    def call
      @relation.eager_load(:me).
                where(rails_skills: {deleted: false}).
                where(mes: {id: Rails.application.credentials.me})
    end
  end
end