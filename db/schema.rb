ActiveRecord::Schema.define(version: 2022_01_31_043812) do

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
    t.bigint "episodes_id"
    t.bigint "podcast_id"
    t.string "activity_type"
    t.integer "rating"
    t.string "review"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["episodes_id"], name: "index_user_activities_on_episodes_id"
    t.index ["podcast_id"], name: "index_user_activities_on_podcast_id"
    t.index ["user_id"], name: "index_user_activities_on_user_id"
  end

  create_table "user_relations", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "user2_id"
    t.string "rel_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
  end

end
