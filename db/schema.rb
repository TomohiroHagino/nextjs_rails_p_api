# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_03_125230) do

  create_table "ec2_skills", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title", limit: 50, comment: "タイトル"
    t.string "body", limit: 5000, comment: "内容"
    t.bigint "me_id", null: false
    t.boolean "deleted", default: false, null: false, comment: "論理削除フラグ"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["me_id"], name: "index_ec2_skills_on_me_id"
  end

  create_table "ecs_skills", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title", limit: 50, comment: "タイトル"
    t.string "body", limit: 5000, comment: "内容"
    t.bigint "me_id", null: false
    t.boolean "deleted", default: false, null: false, comment: "論理削除フラグ"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["me_id"], name: "index_ecs_skills_on_me_id"
  end

  create_table "mes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "introduce", limit: 500, comment: "前置き文"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "frontend", limit: 50, comment: "フロントエンド"
    t.string "backend", limit: 50, comment: "バックエンド"
    t.string "infra", limit: 50, comment: "インフラ"
    t.string "other", limit: 50, comment: "その他"
    t.boolean "deleted", default: false, null: false, comment: "論理削除フラグ"
  end

  create_table "mysql_skills", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title", limit: 50, comment: "タイトル"
    t.string "body", limit: 5000, comment: "内容"
    t.bigint "me_id", null: false
    t.boolean "deleted", default: false, null: false, comment: "論理削除フラグ"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["me_id"], name: "index_mysql_skills_on_me_id"
  end

  create_table "next_js_skills", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title", limit: 50, comment: "タイトル"
    t.string "body", limit: 5000, comment: "内容"
    t.bigint "me_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "deleted", default: false, null: false, comment: "論理削除フラグ"
    t.index ["me_id"], name: "index_next_js_skills_on_me_id"
  end

  create_table "rails_skills", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title", limit: 50, comment: "タイトル"
    t.string "body", limit: 5000, comment: "内容"
    t.bigint "me_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "deleted", default: false, null: false, comment: "論理削除フラグ"
    t.index ["me_id"], name: "index_rails_skills_on_me_id"
  end

  create_table "rds_skills", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title", limit: 50, comment: "タイトル"
    t.string "body", limit: 5000, comment: "内容"
    t.bigint "me_id", null: false
    t.boolean "deleted", default: false, null: false, comment: "論理削除フラグ"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["me_id"], name: "index_rds_skills_on_me_id"
  end

  create_table "react_skills", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title", limit: 50, comment: "タイトル"
    t.string "body", limit: 5000, comment: "内容"
    t.bigint "me_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "deleted", default: false, null: false, comment: "論理削除フラグ"
    t.index ["me_id"], name: "index_react_skills_on_me_id"
  end

  create_table "ruby_skills", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title", limit: 50, comment: "タイトル"
    t.string "body", limit: 5000, comment: "内容"
    t.bigint "me_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "deleted", default: false, null: false, comment: "論理削除フラグ"
    t.index ["me_id"], name: "index_ruby_skills_on_me_id"
  end

  create_table "s3_skills", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title", limit: 50, comment: "タイトル"
    t.string "body", limit: 5000, comment: "内容"
    t.bigint "me_id", null: false
    t.boolean "deleted", default: false, null: false, comment: "論理削除フラグ"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["me_id"], name: "index_s3_skills_on_me_id"
  end

  create_table "sessions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "name"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "deleted", default: false, null: false, comment: "論理削除フラグ"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "ec2_skills", "mes"
  add_foreign_key "ecs_skills", "mes"
  add_foreign_key "mysql_skills", "mes"
  add_foreign_key "next_js_skills", "mes"
  add_foreign_key "rails_skills", "mes"
  add_foreign_key "rds_skills", "mes"
  add_foreign_key "react_skills", "mes"
  add_foreign_key "ruby_skills", "mes"
  add_foreign_key "s3_skills", "mes"
end
