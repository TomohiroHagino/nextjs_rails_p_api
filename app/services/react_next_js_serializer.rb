class ReactNextJsSerializer
  attr_accessor :me, :react_js_skills, :next_js_skills
  delegate :call, to: :new

  def initialize(args)
    @react_js_skills = args[:react_js_skills]
    @next_js_skills = args[:next_js_skills]
  end

  def call
    rs_map = react_js_skills.map do |rs| 
      result = {}
      result["id"] = "React.js" + rs.id.to_s
      result["title"] = rs.title
      result["body"] = rs.body
      result
    end
    nx_map = next_js_skills.map do |nx|
      result = {}
      result["id"] = "Next.js" + nx.id.to_s
      result["title"] = nx.title
      result["body"] = nx.body
      result
    end
    { react_js_skills: rs_map, next_js_skills: nx_map }.to_json
  end
end