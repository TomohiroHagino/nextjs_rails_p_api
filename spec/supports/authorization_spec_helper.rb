module AuthorizationSpecHelper
  def sign_in(user)
    post "http://localhost:3000/api/auth", params: { email: user[:email], password: user[:password] }
    # レスポンスのHeadersからトークン認証に必要な要素を抜き出して返す
    response.headers.slice('client', 'uid', 'token-type', 'access-token')
  end
end