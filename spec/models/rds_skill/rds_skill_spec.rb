require 'rails_helper'

RSpec.describe RdsSkill, type: :model do
  describe 'リレーション ' do
    it { is_expected.to belong_to(:me) }
  end

  describe '.rds_skills' do
    let(:me) { create(:me) }

    context 'オブジェクトが取得できる' do
      let(:rds_skill) { create(:rds_skill, me_id: me.id) }
      it do
        me
        rds_skill
        expect(RdsSkill.myself_rds_skills).to eq([rds_skill])
      end
    end

    context 'オブジェクトが取得できない' do
      it do
        me
        expect(RdsSkill.myself_rds_skills).to eq([])
      end
    end
  end
end