class ReactOrNextJsSkillDeleter
  attr_accessor :obj, :rails_skill_params
  delegate :call, to: :new

  def initialize(args)
    @rails_skill = args[:obj]
    @rails_skill_params = args[:params]
  end

  def call
    rails_skill.update_deleted(false) ? true
                                      : resource.errors
  end
end