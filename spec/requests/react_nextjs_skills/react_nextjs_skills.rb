require 'rails_helper'

RSpec.describe 'Api::ReactNextJsSkills', type: :request do

  describe 'GET /index' do
    let(:me) { create(:me) }
    before { me }

    context "ログインしていない場合" do
      it "401エラー" do
        get "/api/list_react_next_js_skills"
        expect(response.status).to eq(401)
      end
    end

    context "ログインしている場合" do
      it "ステータス200" do
        user_params = { email: "example@example.com", password: "password" }
        auth_tokens = sign_in(user_params)
        # devise token auth認証
        get "/api/list_react_next_js_skills", params: {}, headers: auth_tokens
        expect(response).to have_http_status 200
      end
    end
  end

  describe 'PUT /update' do
    let(:me) { create(:me) }
    let(:next_js_skill) { create(:next_js_skill, me_id: me.id) }
    let!(:next_js_skill_params) { { next_js_skill: { id: next_js_skill.id, title: "REACT_NEXT_JS_SKILLのスキル", body: "テスト内容", me_id: "1" } } }

    context "ログインしていない場合" do
      it "401エラー" do
        me
        next_js_skill
        put "/api/update_next_js_skill", params: next_js_skill_params
        expect(response.status).to eq(401)
      end
    end

    context "ログインしている場合" do
      context "許可している値を渡された時" do
        it "200(:ok)" do
          me
          next_js_skill
          user_params = { email: "example@example.com", password: "password" }
          auth_tokens = sign_in(user_params)
          # devise token auth認証
          put "/api/update_next_js_skill/", params: next_js_skill_params, headers: auth_tokens
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
    let(:next_js_skill) { create(:next_js_skill, me_id: me.id) }
    let!(:next_js_skill_params) { { next_js_skill: { id: next_js_skill.id, deleted: true } } }

    context "ログインしていない場合" do
      it "401エラー" do
        me
        next_js_skill
        put "/api/delete_next_js_skill", params: next_js_skill_params
        expect(response.status).to eq(401)
      end
    end

    context "ログインしている場合" do
      context "許可している値を渡された時" do
        it "200(:ok)" do
          me
          next_js_skill
          user_params = { email: "example@example.com", password: "password" }
          auth_tokens = sign_in(user_params)
          # devise token auth認証
          put "/api/delete_next_js_skill/", params: next_js_skill_params, headers: auth_tokens
          expect(response).to have_http_status 200
        end
      end

      # バリデーターで弾くのでテスト外
      # context "許可していない値を渡された時" do
      # end
    end
  end
end