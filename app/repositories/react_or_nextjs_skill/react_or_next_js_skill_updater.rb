class ReactOrNextJsSkillUpdater
  attr_accessor :react_or_nextjs_skill, :params

  def initialize(args)
    if args[:params][:id].include?("React.js")
      @react_or_nextjs_skill = Module.const_get("ReactSkill").find(args[:params][:id].gsub("React.js",""))
    else
      @react_or_nextjs_skill = Module.const_get("NextJsSkill").find(args[:params][:id].gsub("Next.js",""))
    end
    @params = args[:params]
  end

  def call
    react_or_nextjs_skill.update(title: params[:title], body: params[:body]) ? { updated: true, response: react_or_nextjs_skill }
                                           : { updated: false, response: nil, errors: react_or_nextjs_skill.errors }
  end
end