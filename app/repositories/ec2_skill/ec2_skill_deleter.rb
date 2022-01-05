class Ec2SkillDeleter
  attr_accessor :ec2_skill, :ec2_skill_params
  delegate :call, to: :new

  def initialize(args)
    @ec2_skill = args[:ec2_skill]
    @ec2_skill_params = args[:params]
  end

  def call
    ec2_skill.update(deleted: true) ? { deleted: true, response: ec2_skill, errors: {} }
                                    : { deleted: false, response: {}, errors: ec2_skill.errors }
  end
end