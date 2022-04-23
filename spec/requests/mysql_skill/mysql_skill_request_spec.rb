require 'rails_helper'

RSpec.describe 'Api::MysqlSkills', type: :request do

  describe 'GET /index' do
    let(:me) { create(:me) }
    before { me }

    context "ログインしていない場合" do
      it "401エラー" do
        get "/api/list_mysql_skills"
        expect(response.status).to eq(401)
      end
    end

    context "ログインしている場合" do
      it "ステータス200" do
        user_params = { email: "example@example.com", password: "password" }
        auth_tokens = sign_in(user_params)
        # devise token auth認証
        get api_list_mysql_skills_path, params: {}, headers: auth_tokens
        expect(response).to have_http_status 200
      end
    end
  end

  describe 'POST /create' do
    let(:me) { create(:me) }
    let!(:mysql_skill_params) { { mysql_skill: { title: "MYSQLのスキル", body: "テスト内容", me_id: "1" } } }
    let!(:mysql_skill_wrong_params) { { mysql_skill: { xxx: "許可していないパラメータ" } } }

    context "ログインしていない場合" do
      it "401エラー" do
        me
        post "/api/create_mysql_skill", params: mysql_skill_params
        expect(response.status).to eq(401)
      end
    end

    context "ログインしている場合" do
      context "許可している値を渡された時" do
        it "201(:created)" do
          me
          user_params = { email: "example@example.com", password: "password" }
          auth_tokens = sign_in(user_params)
          # devise token auth認証
          post "/api/create_mysql_skill", params: mysql_skill_params, headers: auth_tokens
          expect(response).to have_http_status 201
        end
      end

      context "許可していない値を渡された時" do
        it "422(:unprocessable_entity)" do
          me
          user_params = { email: "example@example.com", password: "password" }
          auth_tokens = sign_in(user_params)
          # devise token auth認証
          post "/api/create_mysql_skill", params: mysql_skill_wrong_params, headers: auth_tokens
          expect(response).to have_http_status 422
        end
      end
    end
  end

  describe 'PUT /update' do
    let(:me) { create(:me) }
    let(:mysql_skill) { create(:mysql_skill, me_id: me.id) }
    let!(:mysql_skill_params) { { mysql_skill: { id: mysql_skill.id, title: "MYSQLのスキル", body: "テスト内容", me_id: "1" } } }

    context "ログインしていない場合" do
      it "401エラー" do
        me
        mysql_skill
        put "/api/update_mysql_skill", params: mysql_skill_params
        expect(response.status).to eq(401)
      end
    end

    context "ログインしている場合" do
      context "許可している値を渡された時" do
        it "200(:ok)" do
          me
          mysql_skill
          user_params = { email: "example@example.com", password: "password" }
          auth_tokens = sign_in(user_params)
          # devise token auth認証
          put "/api/update_mysql_skill/", params: mysql_skill_params, headers: auth_tokens
          expect(response).to have_http_status 200
        end
      end

      # バリデーターで弾くのでテスト外
      # context "許可していない値を渡された時" do
      # end
    end
  end

  describe 'PUT /destroy' do
    let(:me) { create(:me) }
    let(:mysql_skill) { create(:mysql_skill, me_id: me.id) }
    let!(:mysql_skill_params) { { mysql_skill: { id: mysql_skill.id, deleted: true } } }

    context "ログインしていない場合" do
      it "401エラー" do
        me
        mysql_skill
        put "/api/delete_mysql_skill", params: mysql_skill_params
        expect(response.status).to eq(401)
      end
    end

    context "ログインしている場合" do
      context "許可している値を渡された時" do
        it "200(:ok)" do
          me
          mysql_skill
          user_params = { email: "example@example.com", password: "password" }
          auth_tokens = sign_in(user_params)
          # devise token auth認証
          put "/api/delete_mysql_skill/", params: mysql_skill_params, headers: auth_tokens
          expect(response).to have_http_status 200
        end
      end

      # バリデーターで弾くのでテスト外
      # context "許可していない値を渡された時" do
      # end
    end
  end
end