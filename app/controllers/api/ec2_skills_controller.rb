module Api
  class Ec2SkillsController < ApplicationController
    before_action :vaidation_token_check
    before_action :set_ec2_skill, only: [:show, :update, :destroy]

    def index
      ec2_skills = Ec2Skill.myself_ec2_skills
      render json: ec2_skills
    end

    def create
      ec2_skill = Ec2SkillCreator.new({ ec2_skill_params: ec2_skill_params }).call
      ec2_skill[:created] ? ( render json: ec2_skill[:response], status: :created )
                          : ( render json: ec2_skill[:errors], status: :unprocessable_entity )
    end

    def update
      result = Ec2SkillUpdater.new({ ec2_skill: @ec2_skill, ec2_skill_params: ec2_skill_params }).call
      result[:updated] ? ( render json: result[:response], status: :ok )
                       : ( render json: result[:errors], status: :unprocessable_entity )
    end

    def destroy
      ec2_skill = Ec2SkillDeleter.new({ ec2_skill: @ec2_skill }).call
      ec2_skill[:deleted] ? ( render json: ec2_skill[:response], status: :ok )
                          : ( render json: ec2_skill[:errors], status: :unprocessable_entity )
    end

    private
    def set_ec2_skill ; @ec2_skill = Ec2Skill.find(ec2_skill_params[:id]) ; end
    def ec2_skill_params ; params.require(:ec2_skill).permit(:id, :me_id, :title, :body) ; end
  end
end
