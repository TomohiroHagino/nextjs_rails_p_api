class MeCreator
  attr_accessor :me
  delegate :call, to: :new

  def initialize(args)
    @klass = Module.const_get("Me")
    @me_params = args[:params]
  end

  def call
    resource = klass.new(me_params)
    resource.create ? true
                    : resource.errors
  end
end