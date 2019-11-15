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

ActiveRecord::Schema.define(version: 2019_11_15_014535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "answer"
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "correct", default: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "games", force: :cascade do |t|
    t.boolean "winner"
    t.integer "score"
    t.bigint "user_id", null: false
    t.bigint "topic_id", null: false
    t.bigint "image_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["image_id"], name: "index_games_on_image_id"
    t.index ["topic_id"], name: "index_games_on_topic_id"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "img_url"
    t.string "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "leaderboards", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "placings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "leaderboard_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["leaderboard_id"], name: "index_placings_on_leaderboard_id"
    t.index ["user_id"], name: "index_placings_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.bigint "topic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["topic_id"], name: "index_questions_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.integer "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "enabled", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.string "avatar_url"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "games", "images"
  add_foreign_key "games", "topics"
  add_foreign_key "games", "users"
  add_foreign_key "placings", "leaderboards"
  add_foreign_key "placings", "users"
  add_foreign_key "questions", "topics"
end
