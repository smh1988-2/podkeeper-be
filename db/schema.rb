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

ActiveRecord::Schema.define(version: 2022_02_02_020611) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "episodes", force: :cascade do |t|
    t.bigint "podcast_id"
    t.string "episodeUrl"
    t.string "trackName"
    t.string "description"
    t.datetime "releaseDate", precision: 6
    t.string "artworkUrl160"
    t.string "artworkUrl600"
    t.integer "trackTimeMillis"
    t.bigint "trackId"
    t.integer "collectionId"
    t.string "collectionName"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["podcast_id"], name: "index_episodes_on_podcast_id"
  end

  create_table "podcasts", force: :cascade do |t|
    t.string "collectionName"
    t.string "artistName"
    t.string "artworkUrl100"
    t.string "artworkUrl600"
    t.string "primaryGenreName"
    t.integer "artistId"
    t.integer "collectionId"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_activities", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "episode_id"
    t.bigint "podcast_id"
    t.string "activity_type"
    t.integer "rating"
    t.string "review"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["episode_id"], name: "index_user_activities_on_episode_id"
    t.index ["podcast_id"], name: "index_user_activities_on_podcast_id"
    t.index ["user_id"], name: "index_user_activities_on_user_id"
  end

  create_table "user_relations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "user2_id"
    t.string "rel_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user2_id"], name: "index_user_relations_on_user2_id"
    t.index ["user_id"], name: "index_user_relations_on_user_id"
  end

  create_table "user_subscriptions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "podcast_id"
    t.integer "podcast_rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["podcast_id"], name: "index_user_subscriptions_on_podcast_id"
    t.index ["user_id"], name: "index_user_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "profile_pic"
  end

  add_foreign_key "user_relations", "users"
  add_foreign_key "user_relations", "users", column: "user2_id"
end
