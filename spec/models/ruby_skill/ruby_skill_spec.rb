require 'rails_helper'

RSpec.describe RubySkill, type: :model do
  describe 'リレーション ' do
    it { is_expected.to belong_to(:me) }
  end

  describe '.ruby_skills' do
    let(:me) { create(:me) }

    context 'オブジェクトが取得できる' do
      let(:ruby_skill) { create(:ruby_skill, me_id: me.id) }
      it do
        me
        ruby_skill
        expect(RubySkill.myself_ruby_skills).to eq([ruby_skill])
      end
    end

    context 'オブジェクトが取得できない' do
      it do
        me
        expect(RubySkill.myself_ruby_skills).to eq([])
      end
    end
  end
end