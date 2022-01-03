class CreateRdsSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :rds_skills do |t|
      t.string :title, comment: 'タイトル', limit: 50
      t.string :body, comment: '内容', limit: 5000
      t.references :me, null: false, foreign_key: true
      t.boolean :deleted, comment: '論理削除フラグ', null: false, default: false

      t.timestamps
    end
  end
end
