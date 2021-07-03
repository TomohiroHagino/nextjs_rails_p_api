module Api
  class ReactAndNextJsSkillsController < ApplicationController
    before_action :authenticate_api_user!
    before_action :set_mes_react_or_next_js_skill, only: [:show, :update, :destroy]

    def index
      me = Me.myself_react_and_next_js_skills
      react_and_next_js_skills_json = ReactNextJsSerializer.new(me)
      render json: react_and_next_js_skills_json 
    end

    def show
      render json: @react_or_next_js_skill_json
    end

    def create
      react_or_next_js_skill = ReactOrNextJsSkillCreator.new({params: react_or_next_js_skill_params})
      react_or_next_js_skill[:success] ? { render json: react_or_next_js_skill[:response], status: :created }
                                       : { render json: react_or_next_js_skill[:errors], status: :unprocessable_entity }
    end

    def update
      react_or_next_js_skill = ReactOrNextJsSkillUpdater.new({
                                obj: @react_or_next_js_skill,
                                params: react_or_next_js_skill_params
                                })
      react_or_next_js_skill[:success] ? { render json: react_or_next_js_skill[:response] }
                                       : { render json: react_or_next_js_skill[:errors], status: :unprocessable_entity }
    end

    def destroy
      rails_skill = ReactOrNextJsSkillDeleter.new({
                      obj: @react_or_next_js_skill,
                      params: react_or_next_js_skill_params
                      })
      rails_skill[:success] ? { render json: react_or_next_js_skill[:response] }
                            : { render json: react_or_next_js_skill[:errors], status: :unprocessable_entity }
    end

    private
    def set_mes_react_or_next_js_skill
      @react_or_next_js_skill = Me.set_me_includes_react_and_next_js_skill({
        type: params[:id],
        params: react_or_next_js_skill_params
        })
    end
    def react_or_next_js_skill_params ; params.require(:react_or_next_js_skill).permit(:type, :title, :body) ; end
  end
end
