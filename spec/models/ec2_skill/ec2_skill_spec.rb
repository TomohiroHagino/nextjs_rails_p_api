require 'rails_helper'

RSpec.describe Ec2Skill, type: :model do
  describe 'リレーション ' do
    it { is_expected.to belong_to(:me) }
  end

  # describe '#インスタンスメソッド' do
  #   let(:xxxxxx) { create(:xxxxxxx) }

  #   before { Xxxx.find_by(id: xxxxxxx.id)&.destroy! }

  #   context 'XXXXなとき' do
  #     it 'XXXXXXされる' do
  #       expect(xxxxxxxxxx).to be_xxx
  #     end
  #   end
  # end

  # describe '.クラスメソッド' do
  #   let(:xxxxxx) { create(:xxxxxxx) }

  #   before { Xxxx.find_by(id: xxxxxxx.id)&.destroy! }

  #   context 'XXXXなとき' do
  #     it 'XXXXXXされる' do
  #       expect(xxxxxxxxxx).to be_xxx
  #     end
  #   end
  # end
end