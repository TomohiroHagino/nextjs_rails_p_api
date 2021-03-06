class MeUpdater
  attr_reader :me, :me_params
  delegate :call, to: :new

  def initialize(args)
    @me = args[:me]
    @me_params = args[:me_params]
  end

  def call
    me.update(me_params) ? { updated: true, response: me, errors: {} }
                         : { updated: false, response: {}, errors: me.errors }
  end
end