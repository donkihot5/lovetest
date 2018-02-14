# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180210112303) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aboutpages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_aboutpages_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_aboutpages_on_user_id"
  end

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "adspages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_adspages_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_adspages_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "commentable_id"
    t.string "commentable_type"
    t.index ["song_id", "created_at"], name: "index_comments_on_song_id_and_created_at"
    t.index ["song_id"], name: "index_comments_on_song_id"
    t.index ["user_id", "created_at"], name: "index_comments_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "cookiepages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_cookiepages_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_cookiepages_on_user_id"
  end

  create_table "galleries", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gallery_image_file_name"
    t.string "gallery_image_content_type"
    t.integer "gallery_image_file_size"
    t.datetime "gallery_image_updated_at"
    t.index ["user_id"], name: "index_galleries_on_user_id"
  end

  create_table "helppages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_helppages_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_helppages_on_user_id"
  end

  create_table "imagecomments", force: :cascade do |t|
    t.text "content"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.bigint "user_id"
    t.bigint "gallery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gallery_id"], name: "index_imagecomments_on_gallery_id"
    t.index ["user_id"], name: "index_imagecomments_on_user_id"
  end

  create_table "imagelikes", force: :cascade do |t|
    t.boolean "imagelike"
    t.bigint "user_id"
    t.bigint "gallery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gallery_id"], name: "index_imagelikes_on_gallery_id"
    t.index ["user_id"], name: "index_imagelikes_on_user_id"
  end

  create_table "infopages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_infopages_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_infopages_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.boolean "like"
    t.bigint "user_id"
    t.bigint "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_likes_on_song_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "songs", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["user_id", "created_at"], name: "index_songs_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_songs_on_user_id"
  end

  create_table "statuspages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_statuspages_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_statuspages_on_user_id"
  end

  create_table "stories", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "story_image_file_name"
    t.string "story_image_content_type"
    t.integer "story_image_file_size"
    t.datetime "story_image_updated_at"
    t.index ["user_id", "created_at"], name: "index_stories_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_stories_on_user_id"
  end

  create_table "termspages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_termspages_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_termspages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "description"
    t.string "user_image_file_name"
    t.string "user_image_content_type"
    t.integer "user_image_file_size"
    t.datetime "user_image_updated_at"
    t.string "profile_image_file_name"
    t.string "profile_image_content_type"
    t.integer "profile_image_file_size"
    t.datetime "profile_image_updated_at"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "aboutpages", "users"
  add_foreign_key "adspages", "users"
  add_foreign_key "comments", "songs"
  add_foreign_key "comments", "users"
  add_foreign_key "cookiepages", "users"
  add_foreign_key "galleries", "users"
  add_foreign_key "helppages", "users"
  add_foreign_key "imagecomments", "galleries"
  add_foreign_key "imagecomments", "users"
  add_foreign_key "imagelikes", "galleries"
  add_foreign_key "imagelikes", "users"
  add_foreign_key "infopages", "users"
  add_foreign_key "likes", "songs"
  add_foreign_key "likes", "users"
  add_foreign_key "songs", "users"
  add_foreign_key "statuspages", "users"
  add_foreign_key "stories", "users"
  add_foreign_key "termspages", "users"
end
