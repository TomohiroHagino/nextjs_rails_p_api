require 'rails_helper'

RSpec.describe ReactSkill, type: :model do
  describe 'リレーション ' do
    it { is_expected.to belong_to(:me) }
  end
end