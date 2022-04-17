class MyselfSkillValidator < BaseValidator
  class Error < ::BaseValidator::Error; end
  # タイトルが空白
  class TitleBlankError < Error
    MSG = 'タイトルを入力してください'
  end
  # 内容が空白
  class BodyBlankError < Error
    MSG = '内容を入力してください'
  end
  class MyselfSkillValidatorError < Error; end

  def initialize(obj)
    @obj = obj
  end

  def validate
    error_messages = []
    error_messages << TitleBlankError::MSG if @obj[:title].blank?
    error_messages << BodyBlankError::MSG if @obj[:body].blank?
    raise MyselfSkillValidatorError.new(msg = error_messages) if error_messages.size > 0
  end
end