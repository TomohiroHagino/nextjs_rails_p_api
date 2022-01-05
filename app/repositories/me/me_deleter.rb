class MeDeleter
  attr_accessor :me, :me_params
  delegate :call, to: :new

  def initialize(args)
    @me = args[:me]
    @me_params = args[:params]
  end

  def call
    me.update_deleted(false) ?  { deleted: true, response: me, errors: {} }
                             : { deleted: false, response: {}, errors: me.errors }
  end
end