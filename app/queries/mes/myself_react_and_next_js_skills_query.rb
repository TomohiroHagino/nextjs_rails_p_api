module Mes
  class MyselfReactAndNextJsSkillsQuery < Query
    def initialize(relation = Me.where(id: 1))
      @relation = relation
    end

    def call
      @relation.select('
        react_skills.id,react_skills.title,react_skills.body,
        next_js_skills.id,next_js_skills.title,next_js_skills.body')
               .joins(:react_skills,:next_js_skills)
               .where(react_skills: { deleted: false })
               .where(next_js_skills: { deleted: false })
               .find_by(mes: {id: Rails.application.credentials.me})
    end
  end
end