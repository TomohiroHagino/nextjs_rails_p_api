class RailsSkillUpdater
  attr_accessor :rails_skill, :rails_skill_params

  def initialize(args)
    @rails_skill = args[:obj]
    @rails_skill_params = args[:params]
  end

  def call
    rails_skill.update(rails_skill_params) ? true
                                           : rails_skill.errors
  end
end