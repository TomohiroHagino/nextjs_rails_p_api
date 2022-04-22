class Ec2SkillCreator
  attr_accessor :klass, :ec2_skill_params
  delegate :call, to: :new

  def initialize(args)
    @klass = Module.const_get("Ec2Skill")
    @ec2_skill_params = args[:params]
  end

  def call
    resource = klass.new(ec2_skill_params)
    resource.save! ? { created: true, response: resource, errors: {} }
                    : { created: false, response: {}, errors: resource.errors }
  end
end