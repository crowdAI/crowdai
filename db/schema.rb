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

ActiveRecord::Schema.define(version: 20160509194714) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_stat_statements"

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
    t.integer  "organizer_id"
    t.string   "challenge"
    t.string   "status_cd",               :default=>"draft"
    t.text     "description"
    t.text     "evaluation_markdown"
    t.text     "rules"
    t.text     "prizes"
    t.text     "resources"
    t.datetime "created_at",              :null=>false
    t.datetime "updated_at",              :null=>false
    t.text     "dataset_description"
    t.text     "submission_instructions"
    t.string   "tagline"
    t.text     "evaluation_rendered"
    t.string   "score_sort_cd"
    t.string   "score_secondary_sort_cd"
  end
  add_index "challenges", ["organizer_id"], :name=>"index_challenges_on_organizer_id", :using=>:btree

  create_table "dataset_file_downloads", force: :cascade do |t|
    t.integer  "participant_id"
    t.integer  "dataset_file_id"
    t.string   "ip_address"
    t.datetime "created_at",      :null=>false
    t.datetime "updated_at",      :null=>false
  end
  add_index "dataset_file_downloads", ["dataset_file_id"], :name=>"index_dataset_file_downloads_on_dataset_file_id", :using=>:btree
  add_index "dataset_file_downloads", ["participant_id"], :name=>"index_dataset_file_downloads_on_participant_id", :using=>:btree

  create_table "dataset_files", force: :cascade do |t|
    t.integer  "seq"
    t.datetime "created_at",          :null=>false
    t.datetime "updated_at",          :null=>false
    t.string   "description"
    t.integer  "challenge_id"
    t.string   "dataset_file_s3_key"
  end
  add_index "dataset_files", ["challenge_id"], :name=>"index_dataset_files_on_challenge_id", :using=>:btree

  create_table "events", force: :cascade do |t|
    t.integer  "challenge_id"
    t.integer  "seq"
    t.string   "event"
    t.datetime "event_time"
    t.datetime "created_at",   :null=>false
    t.datetime "updated_at",   :null=>false
  end
  add_index "events", ["challenge_id"], :name=>"index_events_on_challenge_id", :using=>:btree

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
    t.integer  "participant_id"
    t.float    "score"
    t.datetime "created_at",        :null=>false
    t.datetime "updated_at",        :null=>false
    t.text     "description"
    t.string   "framework"
    t.float    "score_secondary"
    t.string   "grading_message"
    t.string   "grading_status_cd", :default=>"ready"
  end
  add_index "submissions", ["challenge_id"], :name=>"index_submissions_on_challenge_id", :using=>:btree
  add_index "submissions", ["participant_id"], :name=>"index_submissions_on_participant_id", :using=>:btree

  create_view "leaderboards", <<-'END_VIEW_LEADERBOARDS', :force => true
SELECT l.row_num,
    l.id,
    l.challenge_id,
    l.participant_id,
    l.name,
    l.entries,
    l.score,
    l.score_secondary,
    l.created_at,
    l.updated_at
   FROM ( SELECT row_number() OVER (PARTITION BY s.challenge_id, s.participant_id ORDER BY s.score DESC, s.score_secondary) AS row_num,
            s.id,
            s.challenge_id,
            s.participant_id,
            p.name,
            cnt.entries,
            s.score,
            s.score_secondary,
            s.created_at,
            s.updated_at
           FROM submissions s,
            participants p,
            ( SELECT c.challenge_id,
                    c.participant_id,
                    count(c.*) AS entries
                   FROM submissions c
                  GROUP BY c.challenge_id, c.participant_id) cnt
          WHERE ((p.id = s.participant_id) AND ((s.grading_status_cd)::text = 'graded'::text) AND (cnt.challenge_id = s.challenge_id) AND (cnt.participant_id = s.participant_id))) l
  WHERE (l.row_num = 1)
  ORDER BY l.score DESC, l.score_secondary
  END_VIEW_LEADERBOARDS

  create_table "organizers", force: :cascade do |t|
    t.string   "organizer"
    t.text     "address"
    t.text     "description"
    t.datetime "created_at",  :null=>false
    t.datetime "updated_at",  :null=>false
    t.boolean  "approved",    :default=>false
  end

  create_table "participants", force: :cascade do |t|
    t.string   "email",                  :default=>"", :null=>false
    t.string   "encrypted_password",     :default=>"", :null=>false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default=>0, :null=>false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",        :default=>0, :null=>false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.boolean  "admin",                  :default=>false
    t.boolean  "verified",               :default=>false
    t.date     "verification_date"
    t.string   "country"
    t.string   "city"
    t.string   "timezone"
    t.datetime "created_at",             :null=>false
    t.datetime "updated_at",             :null=>false
    t.string   "unconfirmed_email"
    t.integer  "organizer_id"
    t.string   "name"
    t.boolean  "email_public",           :default=>false
    t.text     "bio"
    t.string   "website"
    t.string   "github"
    t.string   "linkedin"
    t.string   "twitter"
  end
  add_index "participants", ["confirmation_token"], :name=>"index_participants_on_confirmation_token", :unique=>true, :using=>:btree
  add_index "participants", ["email"], :name=>"index_participants_on_email", :unique=>true, :using=>:btree
  add_index "participants", ["organizer_id"], :name=>"index_participants_on_organizer_id", :using=>:btree
  add_index "participants", ["reset_password_token"], :name=>"index_participants_on_reset_password_token", :unique=>true, :using=>:btree
  add_index "participants", ["unlock_token"], :name=>"index_participants_on_unlock_token", :unique=>true, :using=>:btree

  create_table "posts", force: :cascade do |t|
    t.integer  "topic_id"
    t.integer  "participant_id"
    t.text     "post"
    t.integer  "votes",          :default=>0
    t.boolean  "flagged",        :default=>false
    t.boolean  "notify",         :default=>true
    t.datetime "created_at",     :null=>false
    t.datetime "updated_at",     :null=>false
  end
  add_index "posts", ["participant_id"], :name=>"index_posts_on_participant_id", :using=>:btree
  add_index "posts", ["topic_id"], :name=>"index_posts_on_topic_id", :using=>:btree

  create_table "submission_files", force: :cascade do |t|
    t.integer  "submission_id"
    t.integer  "seq"
    t.datetime "created_at",             :null=>false
    t.datetime "updated_at",             :null=>false
    t.string   "submission_file_s3_key"
  end
  add_index "submission_files", ["submission_id"], :name=>"index_submission_files_on_submission_id", :using=>:btree

  create_table "topics", force: :cascade do |t|
    t.integer  "challenge_id"
    t.integer  "participant_id"
    t.string   "topic"
    t.boolean  "sticky",         :default=>false
    t.integer  "views",          :default=>0
    t.integer  "posts_count",    :default=>0
    t.datetime "created_at",     :null=>false
    t.datetime "updated_at",     :null=>false
  end
  add_index "topics", ["challenge_id"], :name=>"index_topics_on_challenge_id", :using=>:btree
  add_index "topics", ["participant_id"], :name=>"index_topics_on_participant_id", :using=>:btree

  add_foreign_key "challenges", "organizers"
  add_foreign_key "dataset_file_downloads", "dataset_files"
  add_foreign_key "dataset_file_downloads", "participants"
  add_foreign_key "events", "challenges"
  add_foreign_key "participants", "organizers"
  add_foreign_key "posts", "participants"
  add_foreign_key "posts", "topics"
  add_foreign_key "submission_files", "submissions"
  add_foreign_key "submissions", "challenges"
  add_foreign_key "submissions", "participants"
  add_foreign_key "topics", "challenges"
  add_foreign_key "topics", "participants"
end
