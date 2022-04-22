module Api
  class RdsSkillsController < ApplicationController
    before_action :vaidation_token_check
    before_action :set_rds_skill, only: [:show, :update, :destroy]

    def index
      rds_skills = RdsSkill.myself_rds_skills
      render json: rds_skills
    end

    def create
      rds_skill = RdsSkillCreator.new({ params: rds_skill_params }).call
      rds_skill[:created] ? ( render json: rds_skill[:response], status: :created )
                          : ( render json: rds_skill[:errors], status: :unprocessable_entity )
    end

    def update
      result = RdsSkillUpdater.new({ rds_skill: @rds_skill,
                                     rds_skill_params: rds_skill_params }).call
      result[:updated] ? ( render json: result[:response] )
                       : ( render json: result[:errors], status: :unprocessable_entity )
    end

    def destroy
      rds_skill = RdsSkillDeleter.new({ rds_skill: @rds_skill }).call
      rds_skill[:deleted] ? ( render json: rds_skill[:response] )
                          : ( render json: rds_skill[:errors], status: :unprocessable_entity )
    end

    private
    def set_rds_skill ; @rds_skill = RdsSkill.find(params[:id]) ; end
    def rds_skill_params ; params.require(:rds_skill).permit(:id, :me_id, :title, :body) ; end
  end
end
