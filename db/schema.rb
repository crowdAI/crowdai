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

ActiveRecord::Schema.define(version: 20160310103938) do

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

  create_table "competitions", force: :cascade do |t|
    t.integer  "hosting_institution_id"
    t.string   "competition"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "status_cd",              default: "draft"
    t.text     "description"
    t.text     "evaluation"
    t.text     "evaluation_criteria"
    t.text     "rules"
    t.text     "prizes"
    t.text     "resources"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end
  add_index "competitions", ["hosting_institution_id"], name: "index_competitions_on_hosting_institution_id", using: :btree

  create_table "dataset_files", force: :cascade do |t|
    t.integer  "dataset_id"
    t.integer  "seq"
    t.string   "filename"
    t.string   "filetype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  add_index "dataset_files", ["dataset_id"], name: "index_dataset_files_on_dataset_id", using: :btree

  create_table "datasets", force: :cascade do |t|
    t.integer  "competition_id"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end
  add_index "datasets", ["competition_id"], name: "index_datasets_on_competition_id", using: :btree

  create_table "hosting_institutions", force: :cascade do |t|
    t.string   "institution"
    t.text     "address"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "approved",    default: false
  end

  create_table "submissions", force: :cascade do |t|
    t.integer  "competition_id"
    t.integer  "user_id"
    t.integer  "team_id"
    t.boolean  "evaluated"
    t.float    "score"
    t.float    "ranking"
    t.string   "submission_type_cd"
    t.boolean  "withdrawn"
    t.date     "withdrawn_date"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end
  add_index "submissions", ["competition_id"], name: "index_submissions_on_competition_id", using: :btree
  add_index "submissions", ["team_id"], name: "index_submissions_on_team_id", using: :btree
  add_index "submissions", ["user_id"], name: "index_submissions_on_user_id", using: :btree

  create_view "leaderboards", <<-'END_VIEW_LEADERBOARDS', :force => true
SELECT s.id,
    s.competition_id,
    s.user_id,
    NULL::unknown AS team_id,
    s.score,
    cnt.entries
   FROM submissions s,
    ( SELECT submissions.competition_id,
            submissions.user_id,
            submissions.team_id,
            count(*) AS entries
           FROM submissions
          GROUP BY submissions.competition_id, submissions.user_id, submissions.team_id) cnt
  WHERE ((s.evaluated = true) AND (s.user_id = cnt.user_id) AND (s.competition_id = cnt.competition_id) AND (s.score = ( SELECT max(m.score) AS max
           FROM submissions m
          WHERE ((m.competition_id = s.competition_id) AND (m.user_id = s.user_id) AND (m.evaluated = true)))))
  END_VIEW_LEADERBOARDS

  create_table "submission_files", force: :cascade do |t|
    t.integer  "submission_id"
    t.integer  "seq"
    t.string   "filename"
    t.string   "filetype"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end
  add_index "submission_files", ["submission_id"], name: "index_submission_files_on_submission_id", using: :btree

  create_table "team_users", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.date     "from_date"
    t.date     "thru_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  add_index "team_users", ["team_id"], name: "index_team_users_on_team_id", using: :btree
  add_index "team_users", ["user_id"], name: "index_team_users_on_user_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "team"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "timelines", force: :cascade do |t|
    t.integer  "competition_id"
    t.integer  "seq"
    t.string   "event"
    t.datetime "event_time"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end
  add_index "timelines", ["competition_id"], name: "index_timelines_on_competition_id", using: :btree

  create_table "user_competitions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "competition_id"
    t.boolean  "rules_accepted"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end
  add_index "user_competitions", ["competition_id"], name: "index_user_competitions_on_competition_id", using: :btree
  add_index "user_competitions", ["user_id"], name: "index_user_competitions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                       default: "",    null: false
    t.string   "encrypted_password",          default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",             default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.boolean  "admin",                       default: false
    t.boolean  "verified",                    default: false
    t.date     "verification_date"
    t.string   "username"
    t.string   "country"
    t.string   "city"
    t.string   "timezone"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "unconfirmed_email"
    t.integer  "hosting_institution_id"
    t.boolean  "hosting_institution_primary", default: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "name"
    t.boolean  "email_public",                default: false
    t.text     "bio"
    t.string   "website"
    t.string   "github"
    t.string   "linkedin"
    t.string   "twitter"
  end
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["hosting_institution_id"], name: "index_users_on_hosting_institution_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  add_foreign_key "competitions", "hosting_institutions"
  add_foreign_key "dataset_files", "datasets"
  add_foreign_key "datasets", "competitions"
  add_foreign_key "submission_files", "submissions"
  add_foreign_key "submissions", "competitions"
  add_foreign_key "submissions", "teams"
  add_foreign_key "submissions", "users"
  add_foreign_key "team_users", "teams"
  add_foreign_key "team_users", "users"
  add_foreign_key "timelines", "competitions"
  add_foreign_key "user_competitions", "competitions"
  add_foreign_key "user_competitions", "users"
  add_foreign_key "users", "hosting_institutions"
end
