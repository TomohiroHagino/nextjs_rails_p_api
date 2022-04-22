module Api
  class ReactAndNextJsSkillsController < ApplicationController

    def index
      me = Me.myself_react_and_next_js_skills
      react_and_next_js_skills_json = ReactNextJsSerializer.new({
                                        react_js_skills: me.react_skills,
                                        next_js_skills: me.next_js_skills,
                                      }).call
      render json: react_and_next_js_skills_json 
    end

    def create
      react_or_next_js_skill = ReactOrNextJsSkillCreator.new({ params: react_or_next_js_skill_params }).call
      react_or_next_js_skill[:created] ? ( render json: react_or_next_js_skill[:response], status: :created )
                                       : ( render json: react_or_next_js_skill[:errors], status: :unprocessable_entity )
    end

    def update
      react_or_next_js_skill = ReactOrNextJsSkillUpdater.new({ react_or_next_js_skill_params: react_or_next_js_skill_params }).call
      if react_or_next_js_skill[:updated]
        me = Me.myself_react_and_next_js_skills
        react_and_next_js_skills_json = ReactNextJsSerializer.new({
                                          react_js_skills: me.react_skills,
                                          next_js_skills: me.next_js_skills,
                                        }).call
        render json: react_and_next_js_skills_json
      else
        render json: react_or_next_js_skill[:errors], status: :unprocessable_entity
      end
    end

    def destroy
      react_or_next_js_skill = ReactOrNextJsSkillDeleter.new({ react_or_next_js_skill_params: react_or_next_js_skill_params }).call
      react_or_next_js_skill[:deleted] ? ( render json: react_or_next_js_skill[:response] )
                                       : ( render json: react_or_next_js_skill[:errors], status: :unprocessable_entity )
    end

    private
    def react_or_next_js_skill_params ; params.require(:react_and_next_js_skill).permit(:model, :id, :me_id, :title, :body) ; end
  end
end
