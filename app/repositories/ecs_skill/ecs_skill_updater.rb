class EcsSkillUpdater
  attr_accessor :ecs_skill, :ecs_skill_params

  def initialize(args)
    @ecs_skill = args[:ecs_skill]
    @ecs_skill_params = args[:ecs_skill_params]
  end

  def call
    ecs_skill.update(ecs_skill_params) ? { updated: true, response: ecs_skill, errors: {} }
                                       : { updated: false, response: {}, errors: ecs_skill.errors }
  end
end
