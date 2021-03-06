class Api::ValidatesController < ApplicationController
  def obj
    result = validate_check(params[:validate])
    render json: { result: result }
  end

  private
  def validate_check(validate_obj)
    MyselfSkillValidator.new(validate_obj).validate
    { status: "ok" }
  rescue MyselfSkillValidator::MyselfSkillValidatorError => e
    logger.warn "---------------レコードの保存に失敗しました。" 
    logger.warn e
    logger.warn "---------------" 
    { status: "ng", messages: e.message }
  end
end
