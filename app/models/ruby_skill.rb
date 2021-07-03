class RubySkill < ApplicationRecord
  belongs_to :me
  scope :myself_ruby_skills, RubySklls::MySelfRubySkillsQuery
  scope :update_deleted!, boolean -> { update!(deleted: true) }
end
