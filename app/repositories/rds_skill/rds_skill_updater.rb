class RdsSkillUpdater
  attr_accessor :rds_skill, :rds_skill_params

  def initialize(args)
    @rds_skill = args[:rds_skill]
    @rds_skill_params = args[:rds_skill_params]
  end

  def call
    rds_skill.update(rds_skill_params) ? { updated: true, response: rds_skill, errors: {} }
                                       : { updated: false, response: {}, errors: rds_skill.errors }
  end
end
