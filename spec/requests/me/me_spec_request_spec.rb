require 'rails_helper'

RSpec.describe 'Api::Me', type: :request do

  describe 'GET /show' do
    let(:me) { create(:me) }
    before { me }

    context "ログインしていない場合" do
      it "401エラー" do
        get "/api/show_me"
        expect(response.status).to eq(401)
      end
    end

    context "ログインしている場合" do
      it do
        user = { email: "example@example.com", password: "password" }
        auth_tokens = sign_in(user)
        # devise token auth認証
        get api_show_me_path, params: {}, headers: auth_tokens
        expect(response).to have_http_status 200
      end
    end
  end

  describe 'PUT /update' do
    let(:me) { create(:me) }
    let!(:me_params) { { me: { id: me.id, introduce: "自己紹介", frontend: "テスト内容", backend: "バックエンド", infra: "インフラ", other: "その他" } } }
    let!(:me_wrong_params) { { me: { id: me.id, xxx: "許可していないパラメータ", introduce: "自己紹介" } } }
    before { me }

    context "ログインしていない場合" do
      it "401エラー" do
        put "/api/update_ec2_skill", params: me_params
        expect(response.status).to eq(401)
      end
    end

    context "ログインしている場合" do
      context "許可している値を渡された時" do
        it "200(:ok)" do
          user_params = { email: "example@example.com", password: "password" }
          auth_tokens = sign_in(user_params)
          # devise token auth認証
          put "/api/update_me/", params: me_params, headers: auth_tokens
          expect(response).to have_http_status 200
        end
      end

      context "許可していない値を渡された時" do
        it "200(:ok)" do
          user_params = { email: "example@example.com", password: "password" }
          auth_tokens = sign_in(user_params)
          # devise token auth認証
          put "/api/update_me/", params: me_wrong_params, headers: auth_tokens
          expect(response).to have_http_status 200
        end
      end
    end
  end
end