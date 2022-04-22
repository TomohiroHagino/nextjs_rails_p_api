require 'rails_helper'

describe 'MyselfSkillValidatorError' do
  let!(:body_blank) { MyselfSkillValidator.new({title: 'テストタイトル', body: ''}) }
  let!(:title_blank) { MyselfSkillValidator.new({title: '', body: 'テスト内容'}) }

  it 'bodyが空白のときはエラー' do
    expect{ body_blank.validate }.to raise_error(MyselfSkillValidator::MyselfSkillValidatorError)
  end

  it 'タイトルが空白のときはエラー' do
    expect{ title_blank.validate }.to raise_error(MyselfSkillValidator::MyselfSkillValidatorError)
  end  
end
