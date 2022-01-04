class ReactOrNextJsSkillDeleter
  attr_accessor :react_or_next_js_skill, :react_or_next_js_skill_params
  delegate :call, to: :new

  def initialize(args)
    if args[:react_or_next_js_skill_params][:id].include?("React.js")
      @react_or_next_js_skill = Module.const_get("ReactSkill").find(args[:react_or_next_js_skill_params][:id].gsub("React.js",""))
    else
      @react_or_next_js_skill = Module.const_get("NextJsSkill").find(args[:react_or_next_js_skill_params][:id].gsub("Next.js",""))
    end
    @react_or_next_js_skill_params = args[:react_or_next_js_skill_params]
  end

  def call
    react_or_next_js_skill.update(deleted: true) ? { deleted: true, response: react_or_next_js_skill }
                                                 : { deleted: false, response: nil, errors: react_or_next_js_skill.errors }
  end
end