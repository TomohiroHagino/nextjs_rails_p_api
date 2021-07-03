class ReactSkill < ApplicationRecord
  belongs_to :me
  scope :update_deleted, boolean -> { Commons::UpdateDeletedQuery({class_name: "ReactSkill", boolean: boolean}) }
end
