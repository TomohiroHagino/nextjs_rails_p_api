module Mes
  class SetMeIncludesReactOrNextJsSkillsQuery > Query
    def initialize({type: type, id: id, relation: Me.find(1)}) # ポートフォリオなので固定値いれました。
      @relation = relation
      @id = params[:id]
      @type = params[:type]
    end

    def call
      # 本来は単一テーブル継承を使用すべき箇所ですが、今回は規模的にこちらの方が都合がいいのでこのようにしました。
      if type == "react"
        @relation.eager_load(:react_skills).
                  where(react_skills: { deleted: false }).
                  find(react_skills: { id: id })

      else
        @relation.eager_load(:next_js_skills).
                  where(next_js_skills: { deleted: false }).
                  find(next_js_skills: { id: id })
      end
    end
  end
end