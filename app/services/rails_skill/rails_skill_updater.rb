class RailsSkillsUpdator
  attr_accessor :rails_skills
  delegate :call, to: :new

  def initialize(args)
    @rails_skill = args[:obj]
    @params = args[:params]
  end

  def call
    true_or_messsage = rails_skill.update(params)
    true_or_messsage ? true_or_messsage
                     : rails_skill.errors
  end
end