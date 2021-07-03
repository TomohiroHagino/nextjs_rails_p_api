class CreateNextJsSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :next_js_skills do |t|
      t.string :title, comment: 'タイトル', limit: 50
      t.string :body, comment: '内容', limit: 5000
      t.references :me, foreign_key: true

      t.timestamps
    end
  end
end
