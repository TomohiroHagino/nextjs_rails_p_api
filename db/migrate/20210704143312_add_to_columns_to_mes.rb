class AddToColumnsToMes < ActiveRecord::Migration[6.0]
  def change
    add_column :mes, :frontend, :string, comment: 'フロントエンド', limit: 50
    add_column :mes, :backend, :string, comment: 'バックエンド', limit: 50
    add_column :mes, :infra, :string, comment: 'インフラ', limit: 50
    add_column :mes, :other, :string, comment: 'その他', limit: 50
  end
end
