class ReactSkill < ApplicationRecord
  belongs_to :me
  scope :update_deleted!, boolean -> { update!(deleted: true) }
end
