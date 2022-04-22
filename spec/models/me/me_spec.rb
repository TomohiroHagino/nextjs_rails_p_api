require 'rails_helper'

RSpec.describe Me, type: :model do
  describe 'リレーション ' do
    it { is_expected.to have_many(:ruby_skills) }
    it { is_expected.to have_many(:rails_skills) }
    it { is_expected.to have_many(:react_skills) }
    it { is_expected.to have_many(:next_js_skills) }
    it { is_expected.to have_many(:ec2_skills) }
    it { is_expected.to have_many(:ecs_skills) }
    it { is_expected.to have_many(:rds_skills) }
    it { is_expected.to have_many(:mysql_skills) }
  end
end