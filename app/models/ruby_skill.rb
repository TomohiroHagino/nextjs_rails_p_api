class RubySkill < ApplicationRecord
  belongs_to :me
  scope :myself_ruby_skills, RubySklls::MySelfRubySkillsQuery
end
