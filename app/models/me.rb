class Me < ApplicationRecord
  has_many :ruby_skills
  has_many :rails_skills
  has_many :react_skills
  has_many :next_js_skills

  scope :myself_react_and_next_js_skills, Mes::MyselfReactAndNextJsSkillsQuery
  # scope :set_me_includes_react_and_next_js_skill, Mes::SetMeIncludesReactOrNextJsSkillsQuery
  scope :search_myself, Mes::SearchMyselfQuery
  # scope :update_deleted, Commons::UpdateDeletedQuery
end
