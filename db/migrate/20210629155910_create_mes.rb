class CreateMes < ActiveRecord::Migration[6.0]
  def change
    create_table :mes do |t|
      t.string :introduce, comment: '前置き文', limit: 500

      t.timestamps
    end
  end
end
