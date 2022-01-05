class EcsSkillDeleter
  attr_accessor :ecs_skill, :ecs_skill_params
  delegate :call, to: :new

  def initialize(args)
    @ecs_skill = args[:ecs_skill]
    @ecs_skill_params = args[:ecs_skill_params]
  end

  def call
    ecs_skill.update(deleted: true) ? { deleted: true, response: ecs_skill, errors: {} }
                                    : { deleted: false, response: {}, errors: ecs_skill.errors }
  end
end