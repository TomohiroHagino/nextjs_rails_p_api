class RailsSkillsCreator
  attr_accessor :rails_skills
  delegate :call, to: :new

  def initialize(args)
    @klass = Module.const_get("RailsSkill")
    @rails_skill_params = args[:params]
  end

  def call
    true_or_messsage = klass.new(rails_skill_params).create
    true_or_messsage ? true_or_messsage
                     : klass.errors
  end
end