module Api
  class RubySkillsController < ApplicationController
    before_action :authenticate_api_user!
    before_action :set_ruby_skill, only: [:show, :update, :destroy, :destroy]

    def index
      ruby_skills = RubySkill.myself_ruby_skills
      render json: ruby_skills
    end

    def show
      render json: @ruby_skills
    end

    def create
      ruby_skill = RubySkillCreator.new({params: ruby_skill_params})
      ruby_skill[:status] ? { render json: ruby_skill[:response], status: :created }
                          : { render json: ruby_skill[:errors], status: :unprocessable_entity }
    end

    def update
      ruby_skill = RubySkillUpdator.new({
                    obj: @ruby_skill,
                    params: ruby_skill_params
                    })
      ruby_skill[:status] ? { render json: ruby_skill[:response] }
                          : { render json: ruby_skill[:errors], status: :unprocessable_entity }
    end

    def destroy
      ruby_skill = RubySkillDeleter.new({
                    obj: @ruby_skill,
                    params: ruby_skill_params
                    })
      ruby_skill[:status] ? { render json: ruby_skill[:response] }
                          : { render json: ruby_skill[:errors], status: :unprocessable_entity }
    end

    private
    def set_ruby_skill ; @ruby_skill = RubySkill.find(params[:id]) ; end
    def ruby_skill_params ; params.require(:ruby_skill).permit(:title) ; end
  end
end
