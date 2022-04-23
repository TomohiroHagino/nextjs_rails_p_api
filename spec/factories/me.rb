FactoryBot.define do
  factory :me do
    id { 1 }
    introduce { "ご覧いただき、ありがとうございます!普段は、バックエンドを担当しています。最近学習しているNext.jsと、普段使用しているRailsを使用してポートフォリオにしました。。" }
    frontend { "Next.js（覚えたて）, React（覚えたて）" }
    backend { "バックエンド： Ruby on Rails(3.5年" }
    infra { "MySQL, Docker, minio, AWS, EC2, RDS, S3" }
    other { "その他：　Github, SourceTree" }
  end
end