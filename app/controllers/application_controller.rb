class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  # skip_before_action :verify_authenticity_token, if: :devise_controller?, raise: false

  def vaidation_token_check
    validation_401 and return unless validate_token
  end

  def validate_token
    user = User.where(email: request.headers["uid"]).last
    return false unless user.present?
    if user.valid_token?(request.headers["access-token"], request.headers["client"])
      true
    else
      false
    end
  end

  def validation_401
    render json: "バリデーション401", status: 401
  end
end
