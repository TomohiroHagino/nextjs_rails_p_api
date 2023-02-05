module Api
  class EcsSkillsController < ApplicationController
    before_action :vaidation_token_check
    before_action :set_ecs_skill, only: [:show, :update, :destroy]

    def index
      ecs_skills = EcsSkill.myself_ecs_skills
      render json: ecs_skills
    end

    def create
      ecs_skill = EcsSkillCreator.new({ ecs_skill_params: ecs_skill_params }).call
      ecs_skill[:created] ? ( render json: ecs_skill[:response], status: :created )
                          : ( render json: ecs_skill[:errors], status: :unprocessable_entity )
    end

    def update
      result = EcsSkillUpdater.new({ ecs_skill: @ecs_skill, ecs_skill_params: ecs_skill_params }).call
      result[:updated] ? ( render json: result[:response], status: :ok )
                       : ( render json: result[:errors], status: :unprocessable_entity )
    end

    def destroy
      ecs_skill = EcsSkillDeleter.new({ ecs_skill: @ecs_skill }).call
      ecs_skill[:deleted] ? ( render json: ecs_skill[:response], status: :ok )
                          : ( render json: ecs_skill[:errors], status: :unprocessable_entity )
    end

    private
    def set_ecs_skill ; @ecs_skill = EcsSkill.find(ecs_skill_params[:id]) ; end
    def ecs_skill_params ; params.require(:ecs_skill).permit(:id, :me_id, :title, :body) ; end
  end
end
