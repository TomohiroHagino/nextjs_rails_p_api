require 'rails_helper'

RSpec.describe MysqlSkill, type: :model do
  describe 'リレーション ' do
    it { is_expected.to belong_to(:me) }
  end

  describe '.mysql_skills' do
    let(:me) { create(:me) }

    context 'オブジェクトが取得できる' do
      let(:mysql_skill) { create(:mysql_skill, me_id: me.id) }
      it do
        me
        mysql_skill
        expect(MysqlSkill.myself_mysql_skills).to eq([mysql_skill])
      end
    end

    context 'オブジェクトが取得できない' do
      it do
        me
        expect(MysqlSkill.myself_mysql_skills).to eq([])
      end
    end
  end
end