class MeUpdator
  attr_accessor :rails_skills
  delegate :call, to: :new

  def initialize(args)
    @me = args[:obj]
    @params = args[:params]
  end

  def call
    true_or_messsage = me.update(params)
    true_or_messsage ? true_or_messsage
                     : me.errors
  end
end