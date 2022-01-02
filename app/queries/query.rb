class Query
  # クエリーオブジェクトに継承させる。
  class << self         
    delegate :call, to: :new
  end
end