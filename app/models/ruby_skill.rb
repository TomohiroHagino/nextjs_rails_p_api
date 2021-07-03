class RubySkill < ApplicationRecord
  belongs_to :me
  scope :myself_ruby_skills, RubySklls::MySelfRubySkillsQuery
  scope :update_deleted, boolean -> { Commons::UpdateDeletedQuery({class_name: "RubySkill", boolean: boolean}) }
end
