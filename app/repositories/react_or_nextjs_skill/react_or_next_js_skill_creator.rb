class ReactOrNextJsSkillCreator
  attr_accessor :klass, :nextjs_skill_params
  delegate :call, to: :new

  def initialize(args)
    @klass = Module.const_get("NextJsSkill")
    @nextjs_skill_params = args[:react_or_next_js_skill_params]
  end

  def call
    resource = klass.new(nextjs_skill_params)
    resource.save ? { created: true, response: resource, errors: {} }
                  : { created: false, response: {}, errors: resource.errors }
  end
end