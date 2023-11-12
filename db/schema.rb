# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2019_09_29_110344) do
  create_table "answers", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "question_id"
    t.text "answer", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "attaches", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "year", null: false
    t.string "attach", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_attaches_on_user_id"
  end

  create_table "comments", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.string "comment"
    t.datetime "comment_at", precision: nil, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "questions", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "subject_id"
    t.text "question", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["subject_id"], name: "index_questions_on_subject_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "records", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "start", precision: nil, null: false
    t.datetime "end", precision: nil, null: false
    t.bigint "subject_id"
    t.string "comment"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["subject_id"], name: "index_records_on_subject_id"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "subjects", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.string "position", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
