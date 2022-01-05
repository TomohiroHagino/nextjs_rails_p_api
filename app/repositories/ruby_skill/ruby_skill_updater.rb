class RubySkillUpdater
  attr_accessor :ruby_skill, :ruby_skill_params

  def initialize(args)
    @ruby_skill = args[:ruby_skill]
    @ruby_skill_params = args[:ruby_skill_params]
  end

  def call
    ruby_skill.update(ruby_skill_params) ? { updated: true, response: ruby_skill, errors: {} }
                                         : { updated: false, response: {}, errors: ruby_skill.errors }
  end
end
