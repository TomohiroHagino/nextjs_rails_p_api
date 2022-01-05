class S3SkillCreator
  attr_accessor :s3_skills
  delegate :call, to: :new

  def initialize(args)
    @klass = Module.const_get("S3Skill")
    @s3_skill_params = args[:params]
  end

  def call
    resource = klass.new(s3_skill_params)
    resource.create ? { created: true, response: resource, errors: {} }
                    : { created: false, response: nil, errors: resource.errors }
  end
end