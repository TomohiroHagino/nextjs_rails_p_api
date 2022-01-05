class RubySkillCreator
  attr_accessor :ruby_skills
  delegate :call, to: :new

  def initialize(args)
    @klass = Module.const_get("RailsSkill")
    @ruby_skill_params = args[:params]
  end

  def call
    resource = klass.new(ruby_skill_params)
    resource.create ? { created: true, response: resource, errors: {} }
                    : { created: false, response: {}, errors: resource.errors }
  end
end