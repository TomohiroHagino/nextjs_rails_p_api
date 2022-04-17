class BaseValidator
  class Error < ::StandardError
    MSG = 'ベースバリデーターエラー'
    def initialize(msg=self.class::MSG)
      super
    end
  end
  def self.validate(*args, &block)
    new(*args, &block).validate
  end
end
