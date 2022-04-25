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

  describe '.search_myself' do
    let(:me) { create(:me) }
    context 'オブジェクトが取得できる' do
      it do
        me
        expect(Me.search_myself).to eq(me)
      end

      it 'ヒットしたオブジェクトのidが1であること' do
        me
        expect(Me.search_myself.id).to eq(1)
      end
    end

    # 自己紹介アプリなので、id=1は必ず存在しなければならない。
    # context 'オブジェクトが取得できない' do
    # end
  end
end