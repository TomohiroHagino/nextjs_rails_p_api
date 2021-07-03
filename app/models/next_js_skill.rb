class NextJsSkill < ApplicationRecord
  belongs_to :me
  scope :update_deleted, boolean -> { Commons::UpdateDeletedQuery({class_name: "NextJsSkill", boolean: boolean}) }
end
