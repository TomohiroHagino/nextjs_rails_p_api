Post.create!(
  [
    { title: 'dummy title', content: 'dummy content' },
  ]
)

Task.create!(
  [
    { title: 'dummy title' },
  ]
)

# sample_user = {
#   name: "ユーザー",
#   image: "https://images.unsplash.com/photo-1601933973783-43cf8a7d4c5f?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80",
#   email: "example@example.com",
#   phone: "03-1234-5555",
#   company: "テスト株式会社",
#   website: "https://www.google.com"
# }

# 10.times.map do |i|
#   u = sample_user
#   u.name = u.name + i.to_s
#   u
# end
