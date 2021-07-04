class MeReactNextJsSerializer
  attr_accessor :me, :react_skills, :next_js_skills
  delegate :call, to: :new

  def initialize(args)
    @me = args[:me]
    @react_skills = args[:react_skills]
    @next_skills = args[:next_skills]
  end

  def call
    me_json = me.to_json
    react_skills_json = react_skills.to_json
    next_skills = next_skills.to_json
    me_json.store("react_skills", react_skills_json)
    me_json.store("next_js_skills", next_js_skills)
    me_json
  end
end