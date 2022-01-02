class RubySkillUpdater
  attr_accessor :ruby_skill, :ruby_skill_params

  def initialize(args)
    @ruby_skill = args[:obj]
    @ruby_skill_params = args[:params]
  end

  def call
    ruby_skill.update(ruby_skill_params) ? true
                                         : ruby_skill.errors
  end
end
