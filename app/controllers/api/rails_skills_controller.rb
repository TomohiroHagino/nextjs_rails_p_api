module Api
  class RailsSkillsController < ApplicationController
    before_action :vaidation_token_check
    before_action :set_rails_skill, only: [:show, :update, :destroy]

    def index
      rails_skills = RailsSkill.myself_rails_skills
      render json: rails_skills
    end

    def create
      rails_skill = RailsSkillCreator.new(rails_skill_params: rails_skill_params).call
      rails_skill[:created] ? ( render json: rails_skill[:response], status: :created )
                            : ( render json: rails_skill[:errors], status: :unprocessable_entity )
    end

    def update
      result = RailsSkillUpdater.new(rails_skill: @rails_skill, rails_skill_params: rails_skill_params).call
      result[:updated] ? ( render json: result[:response] )
                       : ( render json: result[:errors], status: :unprocessable_entity )
    end

    def destroy
      rails_skill = RailsSkillDeleter.new(rails_skill: @rails_skill).call
      rails_skill[:deleted] ? ( render json: rails_skill[:response] )
                            : ( render json: rails_skill[:errors], status: :unprocessable_entity )
    end

    private
    def set_rails_skill ; @rails_skill = RailsSkill.find(rails_skill_params[:id]) ; end
    def rails_skill_params ; params.require(:rails_skill).permit(:id, :me_id, :title, :body) ; end
  end
end
