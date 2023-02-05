class S3SkillCreator
  attr_accessor :klass, :s3_skill_params
  delegate :call, to: :new

  def initialize(args)
    @klass = Module.const_get("S3Skill")
    @s3_skill_params = args[:s3_skill_params]
  end

  def call
    resource = klass.new(s3_skill_params)
    resource.save ? { created: true, response: resource, errors: {} }
                  : { created: false, response: nil, errors: resource.errors }
  end
end