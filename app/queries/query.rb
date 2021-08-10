class Query
  class << self         
    delegate :call, to: :new
  end
end