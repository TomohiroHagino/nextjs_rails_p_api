module Api
  class RubySkillsController < ApplicationController
    before_action :vaidation_token_check
    before_action :set_ruby_skill, only: [:show, :update, :destroy, :destroy]

    def index
      ruby_skills = RubySkill.myself_ruby_skills
      render json: ruby_skills
    end

    def create
      ruby_skill = RubySkillCreator.new({ params: ruby_skill_params })
      ruby_skill[:created] ? ( render json: ruby_skill[:response] )
                           : ( render json: ruby_skill[:errors], status: :unprocessable_entity )
    end

    def update
      result = RubySkillUpdater.new({ ruby_skill: @ruby_skill,
                                      ruby_skill_params: ruby_skill_params }).call
      result[:updated] ? ( render json: result[:response] )
                       : ( render json: result[:errors], status: :unprocessable_entity )
    end

    def destroy
      ruby_skill = RubySkillDeleter.new({ ruby_skill: @ruby_skill,
                                          ruby_skill_params: ruby_skill_params }).call
      ruby_skill[:status] ? ( render json: ruby_skill[:response] )
                          : ( render json: ruby_skill[:errors], status: :unprocessable_entity )
    end

    private
    def set_ruby_skill ; @ruby_skill = RubySkill.find(params[:id]) ; end
    def ruby_skill_params ; params.require(:ruby_skill).permit(:id, :title, :body) ; end
  end
end
