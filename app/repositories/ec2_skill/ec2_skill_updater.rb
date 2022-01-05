class Ec2SkillUpdater
  attr_accessor :ec2_skill, :ec2_skill_params

  def initialize(args)
    @ec2_skill = args[:ec2_skill]
    @ec2_skill_params = args[:ec2_skill_params]
  end

  def call
    ec2_skill.update(ec2_skill_params) ? { updated: true, response: ec2_skill, errors: {} }
                                       : { updated: false, response: {}, errors: ec2_skill.errors }
  end
end
