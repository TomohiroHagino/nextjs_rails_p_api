module Api
  class MesController < ApplicationController
    # before_action :authenticate_api_user!
    before_action :set_me, only: [:show, :update]

    def show
      render json: @me
    end

    def update
      rails_skill = MeUpdator.new({ obj: @rails_skill,
                                    params: rails_skill_params })
      rails_skill[:status] ? ( render json: rails_skill[:response] )
                           : ( render json: rails_skill[:errors], status: :unprocessable_entity )
    end

    private
    def set_me ; @me = Me.search_myself ; end
    def me_params ; params.require(:me).permit(:introduce) ; end
  end
end
