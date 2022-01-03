class S3SkillUpdater
  attr_accessor :s3_skill, :s3_skill_params

  def initialize(args)
    @s3_skill = args[:s3_skill]
    @s3_skill_params = args[:s3_skill_params]
  end

  def call
    s3_skill.update(s3_skill_params) ? { updated: true, response: s3_skill }
                                     : { updated: false, response: nil, errors: s3_skill.errors }
  end
end
