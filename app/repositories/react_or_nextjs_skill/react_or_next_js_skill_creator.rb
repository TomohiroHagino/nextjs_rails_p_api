class ReactOrNextJsSkillCreator
  attr_accessor :rails_skills
  delegate :call, to: :new

  def initialize(args)
    @klass = Module.const_get("NextjsSkill")
    @nextjs_skill_params = args[:params]
  end

  def call
    resource = klass.new(rails_skill_params)
    resource.create ? true
                    : resource.errors
  end
end