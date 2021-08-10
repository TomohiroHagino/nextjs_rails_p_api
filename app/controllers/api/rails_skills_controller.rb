module Api
  class RailsSkillsController < ApplicationController
    # before_action :authenticate_api_user!
    before_action :set_rails_skill, only: [:show, :update, :destroy]

    def index
      rails_skills = RailsSkill.myself_rails_skills
      render json: rails_skills
    end

    def show
      render json: @rails_skills
    end

    def create
      rails_skill = RailsSkillCreator.new({ params: rails_skill_params })
      rails_skill[:status] ? ( render json: rails_skill[:response], status: :created )
                           : ( render json: rails_skill[:errors], status: :unprocessable_entity )
    end

    def update
      true_or_messages = RailsSkillUpdater.new({ obj: @rails_skill,
                                            params: rails_skill_params }).call

      true_or_messages ? ( render json: { status: true_or_messages } )
                       : ( render json: true_or_messages, status: :unprocessable_entity )
    end

    def destroy
      rails_skill = RailsSkillDeleter.new({ obj: @rails_skill })
      rails_skill[:status] ? ( render json: rails_skill[:response] )
                           : ( render json: rails_skill[:errors], status: :unprocessable_entity )
    end

    private
    def set_rails_skill ; @rails_skill = RailsSkill.find(params[:id]) ; end
    def rails_skill_params ; params.require(:rails_skill).permit(:id, :title, :body) ; end
  end
end
