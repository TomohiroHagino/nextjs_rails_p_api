class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, comment: 'タイトル', limit: 50
      t.string :content, comment: '内容', limit: 500

      t.timestamps
    end
  end
end
