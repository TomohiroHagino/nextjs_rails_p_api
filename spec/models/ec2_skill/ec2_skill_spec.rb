require 'rails_helper'

RSpec.describe Ec2Skill, type: :model do
  describe 'リレーション ' do
    it { is_expected.to belong_to(:me) }
  end

  describe '.myself_ec2_skills' do
    let(:me) { create(:me) }

    context 'オブジェクトが取得できる' do
      let(:ec2_skill) { create(:ec2_skill, me_id: me.id) }
      it do
        me
        ec2_skill
        expect(Ec2Skill.myself_ec2_skills).to eq([ec2_skill])
      end
    end

    context 'オブジェクトが取得できない' do
      it do
        me
        expect(Ec2Skill.myself_ec2_skills).to eq([])
      end
    end
  end
end