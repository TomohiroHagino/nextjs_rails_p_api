class RailsSkillDeleter
  attr_accessor :rails_skill
  delegate :call, to: :new

  def initialize(args)
    @rails_skill = args[:rails_skill]
  end

  def call
    rails_skill.update(deleted: true) ? { deleted: true, response: rails_skill, errors: {} }
                                      : { deleted: false, response: {}, errors: rails_skill.errors }
  end
end