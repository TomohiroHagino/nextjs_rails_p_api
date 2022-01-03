module Mes
  class SetMeIncludesReactOrNextJsSkillsQuery < Query
    def initialize
      @relation = Module.const_get("Me")
    end

    def call(args)
      if args[:type] == "react"
        @relation.eager_load(:react_skills).
                  where(react_skills: { deleted: false }).
                  find_by(react_skills: { id: args[:id].gsub("React.js","") })
      else
        @relation.eager_load(:next_js_skills).
                  where(next_js_skills: { deleted: false }).
                  find_by(next_js_skills: { id: args[:id].gsub("Next.js","") })
      end
    end
  end
end