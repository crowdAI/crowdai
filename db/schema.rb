# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160407081843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bootsy_image_galleries", force: :cascade do |t|
    t.integer  "bootsy_resource_id"
    t.string   "bootsy_resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: :cascade do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenges", force: :cascade do |t|
    t.integer  "hosting_institution_id"
    t.string   "challenge"
    t.string   "status_cd",               :default=>"draft"
    t.text     "description"
    t.text     "evaluation"
    t.text     "evaluation_criteria"
    t.text     "rules"
    t.text     "prizes"
    t.text     "resources"
    t.datetime "created_at",              :null=>false
    t.datetime "updated_at",              :null=>false
    t.text     "dataset_description"
    t.text     "submission_instructions"
  end
  add_index "challenges", ["hosting_institution_id"], :name=>"index_challenges_on_hosting_institution_id", :using=>:btree

  create_table "dataset_files", force: :cascade do |t|
    t.integer  "seq"
    t.datetime "created_at",                :null=>false
    t.datetime "updated_at",                :null=>false
    t.string   "description"
    t.string   "dataset_file_file_name"
    t.string   "dataset_file_content_type"
    t.integer  "dataset_file_file_size"
    t.datetime "dataset_file_updated_at"
    t.integer  "challenge_id"
  end
  add_index "dataset_files", ["challenge_id"], :name=>"index_dataset_files_on_challenge_id", :using=>:btree

  create_table "file_attachments", force: :cascade do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.string   "description"
    t.datetime "created_at",                   :null=>false
    t.datetime "updated_at",                   :null=>false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "file_attachment_file_name"
    t.string   "file_attachment_content_type"
    t.integer  "file_attachment_file_size"
    t.datetime "file_attachment_updated_at"
  end
  add_index "file_attachments", ["attachable_type", "attachable_id"], :name=>"index_file_attachments_on_attachable_type_and_attachable_id", :using=>:btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           :null=>false
    t.integer  "sluggable_id",   :null=>false
    t.string   "sluggable_type", :limit=>50
    t.string   "scope"
    t.datetime "created_at"
  end
  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], :name=>"index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", :unique=>true, :using=>:btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name=>"index_friendly_id_slugs_on_slug_and_sluggable_type", :using=>:btree
  add_index "friendly_id_slugs", ["sluggable_id"], :name=>"index_friendly_id_slugs_on_sluggable_id", :using=>:btree
  add_index "friendly_id_slugs", ["sluggable_type"], :name=>"index_friendly_id_slugs_on_sluggable_type", :using=>:btree

  create_table "hosting_institutions", force: :cascade do |t|
    t.string   "institution"
    t.text     "address"
    t.text     "description"
    t.datetime "created_at",  :null=>false
    t.datetime "updated_at",  :null=>false
    t.boolean  "approved",    :default=>false
  end

  create_table "images", force: :cascade do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "description"
    t.datetime "created_at",         :null=>false
    t.datetime "updated_at",         :null=>false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end
  add_index "images", ["imageable_type", "imageable_id"], :name=>"index_images_on_imageable_type_and_imageable_id", :using=>:btree

  create_table "submissions", force: :cascade do |t|
    t.integer  "challenge_id"
    t.integer  "user_id"
    t.integer  "team_id"
    t.boolean  "evaluated",          :default=>false
    t.float    "score"
    t.string   "submission_type_cd"
    t.datetime "created_at",         :null=>false
    t.datetime "updated_at",         :null=>false
    t.text     "description"
  end
  add_index "submissions", ["challenge_id"], :name=>"index_submissions_on_challenge_id", :using=>:btree
  add_index "submissions", ["team_id"], :name=>"index_submissions_on_team_id", :using=>:btree
  add_index "submissions", ["user_id"], :name=>"index_submissions_on_user_id", :using=>:btree



  create_table "posts", force: :cascade do |t|
    t.integer  "topic_id"
    t.integer  "user_id"
    t.text     "post"
    t.integer  "votes",      :default=>0
    t.boolean  "flagged",    :default=>false
    t.boolean  "notify",     :default=>true
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end
  add_index "posts", ["topic_id"], :name=>"index_posts_on_topic_id", :using=>:btree
  add_index "posts", ["user_id"], :name=>"index_posts_on_user_id", :using=>:btree

  create_table "submission_files", force: :cascade do |t|
    t.integer  "submission_id"
    t.integer  "seq"
    t.datetime "created_at",                   :null=>false
    t.datetime "updated_at",                   :null=>false
    t.string   "submission_file_file_name"
    t.string   "submission_file_content_type"
    t.integer  "submission_file_file_size"
    t.datetime "submission_file_updated_at"
  end
  add_index "submission_files", ["submission_id"], :name=>"index_submission_files_on_submission_id", :using=>:btree

  create_table "team_users", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.date     "from_date"
    t.date     "thru_date"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end
  add_index "team_users", ["team_id"], :name=>"index_team_users_on_team_id", :using=>:btree
  add_index "team_users", ["user_id"], :name=>"index_team_users_on_user_id", :using=>:btree

  create_table "teams", force: :cascade do |t|
    t.string   "team"
    t.text     "description"
    t.datetime "created_at",  :null=>false
    t.datetime "updated_at",  :null=>false
  end

  create_table "timelines", force: :cascade do |t|
    t.integer  "challenge_id"
    t.integer  "seq"
    t.string   "event"
    t.datetime "event_time"
    t.datetime "created_at",   :null=>false
    t.datetime "updated_at",   :null=>false
  end
  add_index "timelines", ["challenge_id"], :name=>"index_timelines_on_challenge_id", :using=>:btree

  create_table "topics", force: :cascade do |t|
    t.integer  "challenge_id"
    t.integer  "user_id"
    t.string   "topic"
    t.boolean  "sticky",       :default=>false
    t.integer  "views",        :default=>0
    t.integer  "posts_count",  :default=>0
    t.datetime "created_at",   :null=>false
    t.datetime "updated_at",   :null=>false
  end
  add_index "topics", ["challenge_id"], :name=>"index_topics_on_challenge_id", :using=>:btree
  add_index "topics", ["user_id"], :name=>"index_topics_on_user_id", :using=>:btree

  create_table "user_challenges", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.boolean  "rules_accepted"
    t.datetime "created_at",     :null=>false
    t.datetime "updated_at",     :null=>false
  end
  add_index "user_challenges", ["challenge_id"], :name=>"index_user_challenges_on_challenge_id", :using=>:btree
  add_index "user_challenges", ["user_id"], :name=>"index_user_challenges_on_user_id", :using=>:btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                       :default=>"", :null=>false
    t.string   "encrypted_password",          :default=>"", :null=>false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               :default=>0, :null=>false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",             :default=>0, :null=>false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.boolean  "admin",                       :default=>false
    t.boolean  "verified",                    :default=>false
    t.date     "verification_date"
    t.string   "country"
    t.string   "city"
    t.string   "timezone"
    t.datetime "created_at",                  :null=>false
    t.datetime "updated_at",                  :null=>false
    t.string   "unconfirmed_email"
    t.integer  "hosting_institution_id"
    t.boolean  "hosting_institution_primary", :default=>false
    t.string   "name"
    t.boolean  "email_public",                :default=>false
    t.text     "bio"
    t.string   "website"
    t.string   "github"
    t.string   "linkedin"
    t.string   "twitter"
  end
  add_index "users", ["confirmation_token"], :name=>"index_users_on_confirmation_token", :unique=>true, :using=>:btree
  add_index "users", ["email"], :name=>"index_users_on_email", :unique=>true, :using=>:btree
  add_index "users", ["hosting_institution_id"], :name=>"index_users_on_hosting_institution_id", :using=>:btree
  add_index "users", ["reset_password_token"], :name=>"index_users_on_reset_password_token", :unique=>true, :using=>:btree
  add_index "users", ["unlock_token"], :name=>"index_users_on_unlock_token", :unique=>true, :using=>:btree

  add_foreign_key "challenges", "hosting_institutions"
  add_foreign_key "posts", "topics"
  add_foreign_key "posts", "users"
  add_foreign_key "submission_files", "submissions"
  add_foreign_key "submissions", "challenges"
  add_foreign_key "submissions", "teams"
  add_foreign_key "submissions", "users"
  add_foreign_key "team_users", "teams"
  add_foreign_key "team_users", "users"
  add_foreign_key "timelines", "challenges"
  add_foreign_key "topics", "challenges"
  add_foreign_key "topics", "users"
  add_foreign_key "user_challenges", "challenges"
  add_foreign_key "user_challenges", "users"
  add_foreign_key "users", "hosting_institutions"

  create_view "leaderboards", <<-'END_VIEW_LEADERBOARDS', :force => true
SELECT s.id,
    s.challenge_id,
    s.user_id,
    u.name,
    NULL::integer AS team_id,
    s.score,
    cnt.entries,
    s.created_at,
    s.updated_at
   FROM submissions s,
    users u,
    ( SELECT submissions.challenge_id,
            submissions.user_id,
            submissions.team_id,
            count(*) AS entries
           FROM submissions
          GROUP BY submissions.challenge_id, submissions.user_id, submissions.team_id) cnt
  WHERE ((u.id = s.user_id) AND (s.evaluated = true) AND (s.user_id = cnt.user_id) AND (s.challenge_id = cnt.challenge_id) AND (s.score = ( SELECT max(m.score) AS max
           FROM submissions m
          WHERE ((m.challenge_id = s.challenge_id) AND (m.user_id = s.user_id) AND (m.evaluated = true)))))
  END_VIEW_LEADERBOARDS
end
