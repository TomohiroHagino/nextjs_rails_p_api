class ReactOrNextJsSkillUpdater
  attr_accessor :react_or_next_js_skill, :react_or_next_js_skill_params

  def initialize(args)
    if args[:react_or_next_js_skill_params][:id].include?("React.js")
      @react_or_next_js_skill = Module.const_get("ReactSkill").find(args[:react_or_next_js_skill_params][:id].gsub("React.js",""))
    else
      @react_or_next_js_skill = Module.const_get("NextJsSkill").find(args[:react_or_next_js_skill_params][:id].gsub("Next.js",""))
    end
    @react_or_next_js_skill_params = args[:react_or_next_js_skill_params]
  end

  def call
    react_or_next_js_skill.update(title: react_or_next_js_skill_params[:title], body: react_or_next_js_skill_params[:body]) ? { updated: true, response: react_or_next_js_skill }
                                           : { updated: false, response: nil, errors: react_or_next_js_skill.errors }
  end
end