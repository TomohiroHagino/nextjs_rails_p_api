class RubySkillDeleter
  attr_accessor :ruby_skill, :ruby_skill_params
  delegate :call, to: :new

  def initialize(args)
    @ruby_skill = args[:ruby_skill]
    @ruby_skill_params = args[:ruby_skill_params]
  end

  def call
    ruby_skill.update(deleted: true) ? { deleted: true, response: ruby_skill, errors: {} }
                                     : { deleted: false, response: {}, errors: ruby_skill.errors }
  end
end