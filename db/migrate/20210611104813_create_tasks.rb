class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, comment: 'タイトル', limit: 50

      t.timestamps
    end
  end
end
