class AddToDeletedTo < ActiveRecord::Migration[6.0]
  def change
    # 論理削除対応
    add_column :mes, :deleted, :boolean, comment: '論理削除フラグ', null: false, default: false
    add_column :ruby_skills, :deleted, :boolean, comment: '論理削除フラグ', null: false, default: false
    add_column :rails_skills, :deleted, :boolean, comment: '論理削除フラグ', null: false, default: false
    add_column :react_skills, :deleted, :boolean, comment: '論理削除フラグ', null: false, default: false
    add_column :next_js_skills, :deleted, :boolean, comment: '論理削除フラグ', null: false, default: false
    add_column :users, :deleted, :boolean, comment: '論理削除フラグ', null: false, default: false
  end
end
