class S3SkillDeleter
  attr_accessor :s3_skill, :s3_skill_params
  delegate :call, to: :new

  def initialize(args)
    @s3_skill = args[:s3_skill]
    @s3_skill_params = args[:s3_skill_params]
  end

  def call
    s3_skill.update(deleted: true) ? { deleted: true, response: s3_skill, errors: {} }
                                   : { deleted: false, response: nil, errors: s3_skill.errors }
  end
end