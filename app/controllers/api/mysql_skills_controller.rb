module Api
  class MysqlSkillsController < ApplicationController
    before_action :vaidation_token_check
    before_action :set_mysql_skill, only: [:show, :update, :destroy]

    def index
      mysql_skills = MysqlSkill.myself_mysql_skills
      render json: mysql_skills
    end

    def create
      mysql_skill = MysqlSkillCreator.new(mysql_skill_params: mysql_skill_params).call
      mysql_skill[:created] ? ( render json: mysql_skill[:response], status: :created )
                            : ( render json: mysql_skill[:errors], status: :unprocessable_entity )
    end

    def update
      result = MysqlSkillUpdater.new(mysql_skill: @mysql_skill, mysql_skill_params: mysql_skill_params).call
      result[:updated] ? ( render json: result[:response] )
                       : ( render json: result[:errors], status: :unprocessable_entity )
    end

    def destroy
      mysql_skill = MysqlSkillDeleter.new(mysql_skill: @mysql_skill).call
      mysql_skill[:deleted] ? ( render json: mysql_skill[:response] )
                            : ( render json: mysql_skill[:errors], status: :unprocessable_entity )
    end

    private
    def set_mysql_skill ; @mysql_skill = MysqlSkill.find(mysql_skill_params[:id]) ; end
    def mysql_skill_params ; params.require(:mysql_skill).permit(:id, :me_id, :title, :body) ; end
  end
end
