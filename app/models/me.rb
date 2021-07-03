class Me < ApplicationRecord
  has_many :ruby_skills
  has_many :rails_skills
  has_many :react_skills
  has_many :next_js_skills

  scope :myself_react_and_next_js_skills, Mes::MySelfRailsSkillsQuery
  scope :set_me_includes_react_and_next_js_skill, args -> Mes::SetMeIncludesReactOrNextJsSkillsQuery({type: type, id: id})
  scope :search_myself, Mes::SearchMyselfQuery
  scope :update_deleted, boolean -> { Commons::UpdateDeletedQuery({class_name: "Me", boolean: boolean}) }
end
