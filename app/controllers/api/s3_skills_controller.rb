module Api
  class S3SkillsController < ApplicationController
    before_action :vaidation_token_check
    before_action :set_s3_skill, only: [:show, :update, :destroy]

    def index
      s3_skills = S3Skill.myself_s3_skills
      render json: s3_skills
    end

    def create
      s3_skill = S3SkillCreator.new({ params: s3_skill_params }).call
      s3_skill[:created] ? ( render json: s3_skill[:response], status: :created )
                         : ( render json: s3_skill[:errors], status: :unprocessable_entity )
    end

    def update
      result = S3SkillUpdater.new({ s3_skill: @s3_skill, s3_skill_params: s3_skill_params }).call
      result[:updated] ? ( render json: result[:response] )
                       : ( render json: result[:errors], status: :unprocessable_entity )
    end

    def destroy
      s3_skill = S3SkillDeleter.new({ s3_skill: @s3_skill }).call
      s3_skill[:deleted] ? ( render json: s3_skill[:response] )
                         : ( render json: s3_skill[:errors], status: :unprocessable_entity )
    end

    private
    def set_s3_skill ; @s3_skill = S3Skill.find(s3_skill_params[:id]) ; end
    def s3_skill_params ; params.require(:s3_skill).permit(:id, :me_id, :title, :body) ; end
  end
end
