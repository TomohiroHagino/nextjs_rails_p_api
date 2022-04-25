require 'rails_helper'

RSpec.describe RailsSkill, type: :model do
  describe 'リレーション ' do
    it { is_expected.to belong_to(:me) }
  end

  describe '.rails_skills' do
    let(:me) { create(:me) }

    context 'オブジェクトが取得できる' do
      let(:rails_skill) { create(:rails_skill, me_id: me.id) }
      it do
        me
        rails_skill
        expect(RailsSkill.myself_rails_skills).to eq([rails_skill])
      end
    end

    context 'オブジェクトが取得できない' do
      it do
        me
        expect(RailsSkill.myself_rails_skills).to eq([])
      end
    end
  end
end