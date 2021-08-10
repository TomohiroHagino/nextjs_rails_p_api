class MeUpdator
  attr_accessor :rails_skills
  delegate :call, to: :new

  def initialize(args)
    @me = args[:me]
    @me_params = args[:params]
  end

  def call
    me.update(me_params) ? true
                         : resource.errors
  end
end