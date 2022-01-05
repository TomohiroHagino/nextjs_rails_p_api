class EcsSkillCreator
  attr_accessor :ecs_skills
  delegate :call, to: :new

  def initialize(args)
    @klass = Module.const_get("EcsSkill")
    @ecs_skill_params = args[:params]
  end

  def call
    resource = klass.new(ecs_skill_params)
    resource.create ? { created: true, response: resource, errors: {} }
                    : { created: false, response: {}, errors: resource.errors }
  end
end