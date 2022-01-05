module Api
  class MesController < ApplicationController
    before_action :vaidation_token_check
    before_action :set_me, only: [:show, :update]

    def show
      render json: @me
    end

    def update
      me = MeUpdater.new({ me: @me,
                           me_params: me_params }).call
      me[:updated] ? ( render json: me[:response] )
                   : ( render json: me[:errors], status: :unprocessable_entity )
    end

    private
    def set_me ; @me = Me.search_myself ; end
    def me_params ; params.require(:me).permit(:introduce, :frontend, :backend, :infra, :other) ; end
  end
end
