module Api
  module Auth
    class RegistrationsController < DeviseTokenAuth::RegistrationsController
      private
      def sign_up_params
        params.permit(:name, :email, :password, :password_confirmation)
      end
    end
  end
end
