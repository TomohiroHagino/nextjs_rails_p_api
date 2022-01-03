require 'rails_helper'
RSpec.feature "Users", type: :feature do
  # # 新規作成モードでユーザーが作成されてログインできること。
  # scenario "create and login user" do
  #   # トップページへアクセス
  #   visit root_path
    
  #   # メアドとパスワードを入力してログイン
  #   fill_in "Email", with: @user.email
  #   fill_in "Password", with: @user.password
  #   click_button "Log in"

  #   expect {
  #     # タスク作成成功のフラッシュメッセージが表示されること
  #     expect(page).to have_content "ようこそ！ #{@user} 様"
  #   }
  #   # メインページにユーザーのemailが表示されている。
  #   expect(page).to have_content @user.email
  # end
end