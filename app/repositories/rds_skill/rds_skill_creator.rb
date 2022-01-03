class RdsSkillCreator
  attr_accessor :rds_skills
  delegate :call, to: :new

  def initialize(args)
    @klass = Module.const_get("RdsSkill")
    @rds_skill_params = args[:params]
  end

  def call
    resource = klass.new(rds_skill_params)
    resource.create ? { created: true, response: resource }
                    : { updated: false, response: nil, errors: resource.errors }
  end
end