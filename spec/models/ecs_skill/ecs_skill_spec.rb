require 'rails_helper'

RSpec.describe EcsSkill, type: :model do
  describe 'リレーション ' do
    it { is_expected.to belong_to(:me) }
  end

  describe '.myself_ecs_skills' do
    let(:me) { create(:me) }

    context 'オブジェクトが取得できる' do
      let(:ecs_skill) { create(:ecs_skill, me_id: me.id) }
      it do
        me
        ecs_skill
        expect(EcsSkill.myself_ecs_skills).to eq([ecs_skill])
      end
    end

    context 'オブジェクトが取得できない' do
      it do
        me
        expect(EcsSkill.myself_ecs_skills).to eq([])
      end
    end
  end
end