module Mes
  class MyselfReactAndNextJsSkillsQuery < Query
    def initialize(relation = Me.where(id: 1))
      @relation = relation
    end

    def call
      @relation.eager_load(:react_skills,:next_js_skills).
                where(react_skills: { deleted: false }).
                where(next_js_skills: { deleted: false }).
                first
    end
  end
end