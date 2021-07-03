class RailsSkillsDeleter
  attr_accessor :rails_skill
  delegate :call, to: :new

  def initialize(args)
    @rails_skill = args[:rails_skill]
  end

  def call
    true_or_messsage = rails_skill.update_deleted(false)
    true_or_messsage ? true_or_messsage
                     : rails_skill.errors
  end
end