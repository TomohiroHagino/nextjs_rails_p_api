class MeReactNextJsSerializer
  attr_accessor :me, :react_js_skills, :next_js_skills
  delegate :call, to: :new

  def initialize(args)
    @me = args[:me]
    @react_js_skills = args[:react_js_skills]
    @next_js_skills = args[:next_js_skills]
  end

  def call
    rs_map = react_js_skills.map {|rs| rs.to_json }
    nx_map = next_js_skills.map {|nx| nx.to_json }
    { me: me, react_skills: rs_map, next_js_skills: nx_map }.to_json
  end
end