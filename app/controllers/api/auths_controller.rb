module Api
  class AuthsController < ApplicationController
    def token_valid_confirm
      vaidation_token_check
    end
  end
end
