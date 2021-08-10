module Api
  class RubySkillsController < ApplicationController
    # before_action :authenticate_api_user!
    before_action :set_ruby_skill, only: [:show, :update, :destroy, :destroy]

    def index
      ruby_skills = RubySkill.myself_ruby_skills
      render json: ruby_skills
    end

    def show
      render json: @ruby_skills
    end

    def create
      ruby_skill = RubySkillCreator.new({ params: ruby_skill_params })
      ruby_skill[:status] ? ( render json: ruby_skill[:response] )
                          : ( render json: ruby_skill[:errors], status: :unprocessable_entity )
    end

    def update
      true_or_messages = RubySkillUpdater.new({ obj: @ruby_skill,
                                          params: ruby_skill_params }).call
      true_or_messages ? ( render json: { status: true_or_messages } )
                       : ( render json: true_or_messages, status: :unprocessable_entity )
    end

    def destroy
      ruby_skill = RubySkillDeleter.new({ obj: @ruby_skill,
                                          params: ruby_skill_params })
      ruby_skill[:status] ? ( render json: ruby_skill[:response] )
                          : ( render json: ruby_skill[:errors], status: :unprocessable_entity )
    end

    private
    def set_ruby_skill ; @ruby_skill = RubySkill.find(params[:id]) ; end
    def ruby_skill_params ; params.require(:ruby_skill).permit(:id, :title, :body) ; end
  end
end
