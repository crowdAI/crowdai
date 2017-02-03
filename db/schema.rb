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

ActiveRecord::Schema.define(version: 20170203142700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_stat_statements"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "ar_internal_metadata", primary_key: "key", id: :string, force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "article_sections", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "seq",                  default: 1
    t.text     "description_markdown"
    t.text     "description"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "icon"
    t.string   "section"
    t.string   "slug"
    t.index ["article_id"], name: "index_article_sections_on_article_id", using: :btree
    t.index ["slug"], name: "index_article_sections_on_slug", unique: true, using: :btree
  end

  create_table "articles", force: :cascade do |t|
    t.string   "article"
    t.integer  "participant_id"
    t.boolean  "published",      default: false
    t.integer  "vote_count",     default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "category"
    t.integer  "view_count",     default: 0
    t.integer  "comment_count",  default: 0
    t.string   "summary"
    t.string   "slug"
    t.index ["participant_id"], name: "index_articles_on_participant_id", using: :btree
    t.index ["slug"], name: "index_articles_on_slug", unique: true, using: :btree
  end

  create_table "challenges", force: :cascade do |t|
    t.integer  "organizer_id"
    t.string   "challenge"
    t.string   "status_cd",                        default: "draft"
    t.text     "description"
    t.text     "evaluation_markdown"
    t.text     "rules"
    t.text     "prizes"
    t.text     "resources"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.text     "dataset_description"
    t.text     "submission_instructions"
    t.string   "tagline"
    t.text     "evaluation"
    t.string   "primary_sort_order_cd",            default: "ascending"
    t.string   "secondary_sort_order_cd"
    t.text     "description_markdown"
    t.text     "rules_markdown"
    t.text     "prizes_markdown"
    t.text     "resources_markdown"
    t.text     "dataset_description_markdown"
    t.text     "submission_instructions_markdown"
    t.boolean  "perpetual_challenge",              default: false
    t.float    "grading_factor",                   default: 1.0
    t.string   "grader_cd"
    t.string   "answer_file_s3_key"
    t.integer  "page_views",                       default: 0
    t.text     "license"
    t.text     "license_markdown"
    t.integer  "participant_count",                default: 0
    t.integer  "submission_count",                 default: 0
    t.string   "score_title"
    t.string   "score_secondary_title"
    t.boolean  "automatic_grading",                default: false
    t.string   "slug"
    t.string   "submission_license"
    t.boolean  "api_required",                     default: false
    t.integer  "daily_submissions"
    t.float    "threshold"
    t.datetime "start_dttm"
    t.datetime "end_dttm"
    t.index ["organizer_id"], name: "index_challenges_on_organizer_id", using: :btree
    t.index ["slug"], name: "index_challenges_on_slug", unique: true, using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "comment"
    t.integer  "participant_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "slug"
    t.index ["participant_id"], name: "index_comments_on_participant_id", using: :btree
    t.index ["slug"], name: "index_comments_on_slug", unique: true, using: :btree
  end

  create_table "container_instances", force: :cascade do |t|
    t.integer  "docker_configuration_id"
    t.string   "status_cd"
    t.string   "message"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "image_sha"
    t.string   "container_sha"
    t.string   "slug"
    t.integer  "submission_id"
    t.index ["docker_configuration_id"], name: "index_container_instances_on_docker_configuration_id", using: :btree
    t.index ["slug"], name: "index_container_instances_on_slug", unique: true, using: :btree
    t.index ["submission_id"], name: "index_container_instances_on_submission_id", using: :btree
  end

  create_table "container_logs", force: :cascade do |t|
    t.integer  "container_instance_id"
    t.string   "log_level_cd"
    t.string   "message"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "log_source_cd"
    t.string   "slug"
    t.index ["container_instance_id"], name: "index_container_logs_on_container_instance_id", using: :btree
    t.index ["slug"], name: "index_container_logs_on_slug", unique: true, using: :btree
  end

  create_table "dataset_file_downloads", force: :cascade do |t|
    t.integer  "participant_id"
    t.integer  "dataset_file_id"
    t.string   "ip_address"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "slug"
    t.index ["dataset_file_id"], name: "index_dataset_file_downloads_on_dataset_file_id", using: :btree
    t.index ["participant_id"], name: "index_dataset_file_downloads_on_participant_id", using: :btree
    t.index ["slug"], name: "index_dataset_file_downloads_on_slug", unique: true, using: :btree
  end

  create_table "dataset_files", force: :cascade do |t|
    t.integer  "seq"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "description"
    t.integer  "challenge_id"
    t.string   "dataset_file_s3_key"
    t.string   "slug"
    t.boolean  "evaluation",          default: false
    t.index ["challenge_id"], name: "index_dataset_files_on_challenge_id", using: :btree
    t.index ["slug"], name: "index_dataset_files_on_slug", unique: true, using: :btree
  end

  create_table "docker_configurations", force: :cascade do |t|
    t.integer  "challenge_id"
    t.string   "image"
    t.string   "mount_point"
    t.boolean  "destroy_after_success"
    t.string   "execute_command"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "name"
    t.boolean  "execute_on_submission", default: false
    t.string   "datasets_directory"
    t.index ["challenge_id"], name: "index_docker_configurations_on_challenge_id", using: :btree
  end

  create_table "docker_files", force: :cascade do |t|
    t.integer  "docker_configuration_id"
    t.string   "configuration_file_s3_key"
    t.string   "directory"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "grading_only",              default: false
    t.boolean  "overwritable",              default: false
    t.index ["docker_configuration_id"], name: "index_docker_files_on_docker_configuration_id", using: :btree
  end

  create_table "email_preferences", force: :cascade do |t|
    t.integer  "participant_id"
    t.boolean  "opt_out_all",     default: false
    t.boolean  "newsletter",      default: true
    t.boolean  "my_leaderboard",  default: true
    t.boolean  "any_post",        default: true
    t.boolean  "my_topic_post",   default: true
    t.boolean  "any_leaderboard", default: true
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["participant_id"], name: "index_email_preferences_on_participant_id", using: :btree
  end

  create_table "emails", force: :cascade do |t|
    t.integer  "model_id"
    t.string   "mailer"
    t.text     "recipients"
    t.text     "options"
    t.string   "status_cd"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "email_preferences_token"
    t.datetime "token_expiration_dttm"
    t.integer  "participant_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "images", force: :cascade do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "slug"
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id", using: :btree
    t.index ["slug"], name: "index_images_on_slug", unique: true, using: :btree
  end

  create_table "organizers", force: :cascade do |t|
    t.string   "organizer"
    t.text     "address"
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "approved",    default: false
    t.string   "slug"
    t.string   "api_key"
    t.index ["slug"], name: "index_organizers_on_slug", unique: true, using: :btree
  end

  create_table "participants", force: :cascade do |t|
    t.string   "email",                   default: "",    null: false
    t.string   "encrypted_password",      default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",         default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.boolean  "admin",                   default: false
    t.boolean  "verified",                default: false
    t.date     "verification_date"
    t.string   "country"
    t.string   "city"
    t.string   "timezone"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "unconfirmed_email"
    t.integer  "organizer_id"
    t.string   "name"
    t.boolean  "email_public",            default: false
    t.text     "bio"
    t.string   "website"
    t.string   "github"
    t.string   "linkedin"
    t.string   "twitter"
    t.boolean  "account_disabled",        default: false
    t.text     "account_disabled_reason"
    t.datetime "account_disabled_dttm"
    t.string   "slug"
    t.string   "api_key"
    t.index ["confirmation_token"], name: "index_participants_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_participants_on_email", unique: true, using: :btree
    t.index ["organizer_id"], name: "index_participants_on_organizer_id", using: :btree
    t.index ["reset_password_token"], name: "index_participants_on_reset_password_token", unique: true, using: :btree
    t.index ["slug"], name: "index_participants_on_slug", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_participants_on_unlock_token", unique: true, using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "topic_id"
    t.integer  "participant_id"
    t.text     "post"
    t.boolean  "flagged",        default: false
    t.boolean  "notify",         default: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "vote_count",     default: 0
    t.string   "slug"
    t.text     "post_markdown"
    t.index ["participant_id"], name: "index_posts_on_participant_id", using: :btree
    t.index ["slug"], name: "index_posts_on_slug", unique: true, using: :btree
    t.index ["topic_id"], name: "index_posts_on_topic_id", using: :btree
  end

  create_table "submission_file_definitions", force: :cascade do |t|
    t.integer  "challenge_id"
    t.integer  "seq"
    t.string   "submission_file_description"
    t.string   "filetype_cd"
    t.boolean  "file_required",               default: false
    t.text     "submission_file_help_text"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["challenge_id"], name: "index_submission_file_definitions_on_challenge_id", using: :btree
  end

  create_table "submission_files", force: :cascade do |t|
    t.integer  "submission_id"
    t.integer  "seq"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "submission_file_s3_key"
    t.string   "slug"
    t.index ["slug"], name: "index_submission_files_on_slug", unique: true, using: :btree
    t.index ["submission_id"], name: "index_submission_files_on_submission_id", using: :btree
  end

  create_table "submission_grades", force: :cascade do |t|
    t.integer  "submission_id"
    t.string   "grading_status_cd"
    t.string   "grading_message"
    t.float    "grading_factor"
    t.float    "score"
    t.float    "score_secondary"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "slug"
    t.index ["slug"], name: "index_submission_grades_on_slug", unique: true, using: :btree
    t.index ["submission_id"], name: "index_submission_grades_on_submission_id", using: :btree
  end

  create_table "submissions", force: :cascade do |t|
    t.integer  "challenge_id"
    t.integer  "participant_id"
    t.float    "score"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.text     "description"
    t.float    "score_secondary"
    t.string   "grading_message"
    t.string   "grading_status_cd",       default: "ready"
    t.text     "description_markdown"
    t.integer  "vote_count",              default: 0
    t.boolean  "post_challenge",          default: false
    t.string   "api"
    t.integer  "docker_configuration_id"
    t.index ["challenge_id"], name: "index_submissions_on_challenge_id", using: :btree
    t.index ["docker_configuration_id"], name: "index_submissions_on_docker_configuration_id", using: :btree
    t.index ["participant_id"], name: "index_submissions_on_participant_id", using: :btree
  end

  create_table "topics", force: :cascade do |t|
    t.integer  "challenge_id"
    t.integer  "participant_id"
    t.string   "topic"
    t.boolean  "sticky",         default: false
    t.integer  "views",          default: 0
    t.integer  "posts_count",    default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "slug"
    t.index ["challenge_id"], name: "index_topics_on_challenge_id", using: :btree
    t.index ["participant_id"], name: "index_topics_on_participant_id", using: :btree
    t.index ["slug"], name: "index_topics_on_slug", unique: true, using: :btree
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id",     null: false
    t.string   "votable_type",   null: false
    t.integer  "participant_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "slug"
    t.index ["participant_id"], name: "index_votes_on_participant_id", using: :btree
    t.index ["slug"], name: "index_votes_on_slug", unique: true, using: :btree
  end

  add_foreign_key "article_sections", "articles"
  add_foreign_key "articles", "participants"
  add_foreign_key "challenges", "organizers"
  add_foreign_key "comments", "participants"
  add_foreign_key "container_instances", "docker_configurations"
  add_foreign_key "container_instances", "submissions"
  add_foreign_key "container_logs", "container_instances"
  add_foreign_key "dataset_file_downloads", "dataset_files"
  add_foreign_key "dataset_file_downloads", "participants"
  add_foreign_key "docker_configurations", "challenges"
  add_foreign_key "docker_files", "docker_configurations"
  add_foreign_key "email_preferences", "participants"
  add_foreign_key "participants", "organizers"
  add_foreign_key "posts", "participants"
  add_foreign_key "posts", "topics"
  add_foreign_key "submission_file_definitions", "challenges"
  add_foreign_key "submission_files", "submissions"
  add_foreign_key "submission_grades", "submissions"
  add_foreign_key "submissions", "challenges"
  add_foreign_key "submissions", "docker_configurations"
  add_foreign_key "submissions", "participants"
  add_foreign_key "topics", "challenges"
  add_foreign_key "topics", "participants"
  add_foreign_key "votes", "participants"

  create_view :leaderboards,  sql_definition: <<-SQL
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
                    WHERE (c.post_challenge = false)
                    GROUP BY c.challenge_id, c.participant_id) cnt
            WHERE ((p.id = s.participant_id) AND ((s.grading_status_cd)::text = 'graded'::text) AND (cnt.challenge_id = s.challenge_id) AND (cnt.participant_id = s.participant_id))) l
    WHERE (l.row_num = 1)
    ORDER BY l.score DESC, l.score_secondary;
  SQL

  create_view :ongoing_leaderboards,  sql_definition: <<-SQL
      SELECT l.row_num,
      l.id,
      l.challenge_id,
      l.participant_id,
      l.name,
      l.entries,
      l.score,
      l.score_secondary,
      l.post_challenge,
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
              s.post_challenge,
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
    ORDER BY l.score DESC, l.score_secondary;
  SQL

  create_view :participant_challenges,  sql_definition: <<-SQL
      SELECT p.id,
      pc.challenge_id,
      pc.participant_id,
      c.organizer_id,
      c.challenge,
      c.description,
      c.rules,
      c.prizes,
      c.resources,
      c.tagline,
      p.name,
      p.email,
      p.last_sign_in_at,
      p.bio,
      p.github,
      p.linkedin,
      p.twitter
     FROM participants p,
      challenges c,
      ( SELECT c_1.id,
              c_1.id AS challenge_id,
              p_1.id AS participant_id
             FROM challenges c_1,
              participants p_1,
              submissions s_1
            WHERE ((s_1.challenge_id = c_1.id) AND (s_1.participant_id = p_1.id))
          UNION
           SELECT c_1.id,
              c_1.id AS challenge_id,
              p_1.id AS participant_id
             FROM challenges c_1,
              participants p_1,
              topics t
            WHERE ((t.challenge_id = c_1.id) AND (t.participant_id = p_1.id))
          UNION
           SELECT t.challenge_id AS id,
              t.challenge_id,
              ps.id AS participant_id
             FROM posts ps,
              topics t
            WHERE (t.id = ps.topic_id)
          UNION
           SELECT df.challenge_id AS id,
              df.challenge_id,
              dfd.participant_id
             FROM dataset_file_downloads dfd,
              dataset_files df
            WHERE (dfd.dataset_file_id = df.id)) pc
    WHERE ((pc.participant_id = p.id) AND (pc.challenge_id = c.id));
  SQL

  create_view :participant_submissions,  sql_definition: <<-SQL
      SELECT s.id,
      s.challenge_id,
      s.participant_id,
      p.name,
      s.grading_status_cd,
      s.post_challenge,
      s.score,
      s.score_secondary,
      count(f.*) AS files,
      s.created_at
     FROM submissions s,
      participants p,
      submission_files f
    WHERE ((s.participant_id = p.id) AND (f.submission_id = s.id))
    GROUP BY s.id, s.challenge_id, s.participant_id, p.name, s.grading_status_cd, s.post_challenge, s.score, s.score_secondary, s.created_at
    ORDER BY s.created_at DESC;
  SQL

end
