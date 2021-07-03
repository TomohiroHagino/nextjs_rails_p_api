module Api
  class RailsSkillsController < ApplicationController
    before_action :authenticate_api_user!
    before_action :set_post, only: [:show, :update, :destroy]

    def index
      rails_skills = RailsSkill.myself_rails_skills
      render json: rails_skills
    end

    def show
      render json: @rails_skills
    end

    def create
      rails_skill = RailsSkillCreator.new({params: rails_skill_params})
      rails_skill[:status] ? { render json: rails_skill[:response], status: :created }
                           : { render json: rails_skill[:errors], status: :unprocessable_entity }
    end

    def update
      rails_skill = RailsSkillUpdator.new({params: rails_skill_params})
      rails_skill[:status] ? { render json: rails_skill[:response] }
                           : { render json: rails_skill[:errors], status: :unprocessable_entity }
    end

    def destroy
      rails_skill = RailsSkillDeleter.new({{params: rails_skill_params}})
      rails_skill[:status] ? { render json: rails_skill[:response] }
                           : { render json: rails_skill[:errors], status: :unprocessable_entity }
    end

    private
    def set_rails_skill ; @rails_skill = RailsSkill.find(params[:id]) ; end
    def rails_skill_params ; params.require(:rails_skill).permit(:title) ; end
  end
end
