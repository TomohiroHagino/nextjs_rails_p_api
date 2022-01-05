class RailsSkillUpdater
  attr_accessor :rails_skill, :rails_skill_params

  def initialize(args)
    @rails_skill = args[:rails_skill]
    @rails_skill_params = args[:rails_skill_params]
  end

  def call
    rails_skill.update(rails_skill_params) ? { updated: true, response: rails_skill, errors: {} }
                                           : { updated: false, response: {}, errors: rails_skill.errors }
  end
end