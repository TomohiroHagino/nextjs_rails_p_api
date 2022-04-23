module Mes
  class MyselfReactAndNextJsSkillsQuery < Query
    # 自分のデータを確実に見てもらいたいので固定値1は許容。
    def initialize(relation = Me.where(id: 1))
      @relation = relation
    end

    def call
      @relation.eager_load(:react_skills,:next_js_skills).
                where(react_skills: { deleted: false }).
                where(next_js_skills: { deleted: false }).
                find_by(mes: {id: 1})
    end
  end
end