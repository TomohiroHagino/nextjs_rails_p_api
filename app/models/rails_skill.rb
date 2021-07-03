class RailsSkill < ApplicationRecord
  belongs_to :me
  scope :myself_rails_skills, RailsSklls::MySelfRailsSkillsQuery
  scope :set_me_includes_react_and_next_js_skill
end
