require 'rails_helper'

describe 'MyselfSkillValidatorError' do
  let!(:title_and_body) { MyselfSkillValidator.new({title: 'テストタイトル', body: 'テスト内容'}) }
  let!(:body_blank) { MyselfSkillValidator.new({title: 'テストタイトル', body: ''}) }
  let!(:title_blank) { MyselfSkillValidator.new({title: '', body: 'テスト内容'}) }

  it 'bodyが空白のときはエラー' do
    expect{ body_blank.validate }.to raise_error(MyselfSkillValidator::MyselfSkillValidatorError)
  end

  it 'タイトルが空白のときはエラー' do
    expect{ title_blank.validate }.to raise_error(MyselfSkillValidator::MyselfSkillValidatorError)
  end

  it '有効' do
    expect{ title_and_body.validate }.not_to raise_error
  end
end
