class RdsSkillCreator
  attr_accessor :klass, :rds_skill_params
  delegate :call, to: :new

  def initialize(args)
    @klass = Module.const_get("RdsSkill")
    @rds_skill_params = args[:params]
  end

  def call
    resource = klass.new(rds_skill_params)
    resource.save! ? { created: true, response: resource, errors: {} }
                   : { created: false, response: {}, errors: resource.errors }
  end
end