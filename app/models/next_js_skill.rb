class NextJsSkill < ApplicationRecord
  belongs_to :me
  scope :update_deleted, Commons::UpdateDeletedQuery
end
