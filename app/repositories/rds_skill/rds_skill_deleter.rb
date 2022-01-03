class RdsSkillDeleter
  attr_accessor :rds_skill, :rds_skill_params
  delegate :call, to: :new

  def initialize(args)
    @rds_skill = args[:rds_skill]
    @rds_skill_params = args[:rds_skill_params]
  end

  def call
    rds_skill.update(deleted: true) ? { deleted: true, response: rds_skill }
                                    : { deleted: false, response: nil, errors: rds_skill.errors }
  end
end