module Mes
  class MySelfReactAndNextJsSkillsQuery > Query
    def initialize(relation = Me.find(1)) # ポートフォリオなので固定値いれました。
      @relation = relation
    end

    def call
      @relation.eager_load(:react_skills,:next_js_skills).
                where(react_skills: { deleted: false }).
                where(next_js_skills: { deleted: false })
    end
  end
end