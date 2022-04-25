require 'rails_helper'

RSpec.describe S3Skill, type: :model do
  describe 'リレーション ' do
    it { is_expected.to belong_to(:me) }
  end

  describe '.s3_skills' do
    let(:me) { create(:me) }

    context 'オブジェクトが取得できる' do
      let(:s3_skill) { create(:s3_skill, me_id: me.id) }
      it do
        me
        s3_skill
        expect(S3Skill.myself_s3_skills).to eq([s3_skill])
      end
    end

    context 'オブジェクトが取得できない' do
      it do
        me
        expect(S3Skill.myself_s3_skills).to eq([])
      end
    end
  end
end