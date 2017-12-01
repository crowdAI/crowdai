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

ActiveRecord::Schema.define(version: 20171201095546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_stat_statements"

  create_table "active_admin_comments", id: :serial, force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_id", null: false
    t.string "resource_type", null: false
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "article_sections", id: :serial, force: :cascade do |t|
    t.integer "article_id"
    t.integer "seq", default: 1
    t.text "description_markdown"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "section"
    t.string "slug"
    t.index ["article_id"], name: "index_article_sections_on_article_id"
    t.index ["slug"], name: "index_article_sections_on_slug", unique: true
  end

  create_table "articles", id: :serial, force: :cascade do |t|
    t.string "article"
    t.integer "participant_id"
    t.boolean "published", default: false
    t.integer "vote_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.integer "view_count", default: 0
    t.string "summary"
    t.string "slug"
    t.string "image_file"
    t.index ["participant_id"], name: "index_articles_on_participant_id"
    t.index ["slug"], name: "index_articles_on_slug", unique: true
  end

  create_table "challenge_rounds", force: :cascade do |t|
    t.bigint "challenge_id"
    t.string "challenge_round"
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "submission_limit"
    t.string "submission_limit_period_cd"
    t.datetime "start_dttm"
    t.datetime "end_dttm"
    t.float "minimum_score"
    t.float "minimum_score_secondary"
    t.index ["challenge_id"], name: "index_challenge_rounds_on_challenge_id"
  end

  create_table "challenges", id: :serial, force: :cascade do |t|
    t.integer "organizer_id"
    t.string "challenge"
    t.string "status_cd", default: "draft"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tagline"
    t.string "primary_sort_order_cd", default: "ascending"
    t.string "secondary_sort_order_cd"
    t.boolean "perpetual_challenge", default: false
    t.float "grading_factor", default: 1.0
    t.string "grader_cd"
    t.string "answer_file_s3_key"
    t.integer "page_views", default: 0
    t.integer "participant_count", default: 0
    t.integer "submission_count", default: 0
    t.string "score_title"
    t.string "score_secondary_title"
    t.boolean "automatic_grading", default: false
    t.string "slug"
    t.string "submission_license"
    t.boolean "api_required", default: false
    t.integer "daily_submissions"
    t.float "threshold"
    t.boolean "media_on_leaderboard", default: false
    t.string "challenge_client_name"
    t.boolean "online_grading", default: true
    t.integer "vote_count", default: 0
    t.text "description_markdown"
    t.text "description"
    t.text "evaluation_markdown"
    t.text "evaluation"
    t.text "rules_markdown"
    t.text "rules"
    t.text "prizes_markdown"
    t.text "prizes"
    t.text "resources_markdown"
    t.text "resources"
    t.text "submission_instructions_markdown"
    t.text "submission_instructions"
    t.text "license_markdown"
    t.text "license"
    t.text "dataset_description_markdown"
    t.text "dataset_description"
    t.string "image_file"
    t.integer "featured_sequence", default: 0
    t.boolean "dynamic_content_flag", default: false
    t.text "dynamic_content"
    t.string "dynamic_content_tab"
    t.text "winner_description_markdown"
    t.text "winner_description"
    t.boolean "winners_tab_active", default: false
    t.integer "current_challenge_round_id"
    t.integer "submission_limit"
    t.string "submission_limit_period_id"
    t.bigint "clef_task_id"
    t.boolean "clef_challenge", default: false
    t.boolean "submissions_page"
    t.index ["clef_task_id"], name: "index_challenges_on_clef_task_id"
    t.index ["organizer_id"], name: "index_challenges_on_organizer_id"
    t.index ["slug"], name: "index_challenges_on_slug", unique: true
  end

  create_table "clef_tasks", force: :cascade do |t|
    t.bigint "organizer_id"
    t.string "task"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "eua_file"
    t.index ["organizer_id"], name: "index_clef_tasks_on_organizer_id"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.integer "topic_id"
    t.integer "participant_id"
    t.text "comment"
    t.boolean "flagged", default: false
    t.boolean "notify", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vote_count", default: 0
    t.string "slug"
    t.text "comment_markdown"
    t.index ["participant_id"], name: "index_posts_on_participant_id"
    t.index ["slug"], name: "index_posts_on_slug", unique: true
    t.index ["topic_id"], name: "index_posts_on_topic_id"
  end

  create_table "dataset_file_downloads", id: :serial, force: :cascade do |t|
    t.integer "participant_id"
    t.integer "dataset_file_id"
    t.string "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dataset_file_id"], name: "index_dataset_file_downloads_on_dataset_file_id"
    t.index ["participant_id"], name: "index_dataset_file_downloads_on_participant_id"
  end

  create_table "dataset_files", id: :serial, force: :cascade do |t|
    t.integer "seq"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.integer "challenge_id"
    t.string "dataset_file_s3_key"
    t.boolean "evaluation", default: false
    t.string "title"
    t.index ["challenge_id"], name: "index_dataset_files_on_challenge_id"
  end

  create_table "email_preferences", id: :serial, force: :cascade do |t|
    t.integer "participant_id"
    t.boolean "newsletter", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "challenges_followed", default: true
    t.boolean "mentions", default: true
    t.boolean "receive_every_email", default: false
    t.boolean "receive_daily_digest", default: true
    t.boolean "receive_weekly_digest", default: false
    t.index ["participant_id"], name: "index_email_preferences_on_participant_id"
  end

  create_table "email_preferences_tokens", force: :cascade do |t|
    t.bigint "participant_id"
    t.string "email_preferences_token"
    t.datetime "token_expiration_dttm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_email_preferences_tokens_on_participant_id"
  end

  create_table "follows", id: :serial, force: :cascade do |t|
    t.integer "followable_id", null: false
    t.string "followable_type", null: false
    t.integer "participant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_follows_on_participant_id"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "job_postings", force: :cascade do |t|
    t.string "title"
    t.string "organisation"
    t.string "contact_name"
    t.string "contact_email"
    t.string "contact_phone"
    t.date "posting_date"
    t.date "closing_date"
    t.string "status_cd"
    t.text "description"
    t.boolean "remote", default: true
    t.string "location"
    t.string "country"
    t.integer "page_views"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "job_url"
  end

  create_table "mandrill_messages", force: :cascade do |t|
    t.jsonb "res"
    t.jsonb "message"
    t.jsonb "meta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizer_applications", id: :serial, force: :cascade do |t|
    t.string "contact_name"
    t.string "email"
    t.string "phone"
    t.string "organization"
    t.string "organization_description"
    t.string "challenge_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizers", id: :serial, force: :cascade do |t|
    t.string "organizer"
    t.text "address"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approved", default: false
    t.string "slug"
    t.string "image_file"
    t.string "tagline"
    t.string "challenge_proposal"
    t.string "api_key"
    t.boolean "clef_organizer", default: false
    t.index ["slug"], name: "index_organizers_on_slug", unique: true
  end

  create_table "participant_clef_tasks", force: :cascade do |t|
    t.bigint "participant_id"
    t.bigint "clef_task_id"
    t.boolean "approved", default: false
    t.string "eua_file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status_cd"
    t.index ["clef_task_id"], name: "index_participant_clef_tasks_on_clef_task_id"
    t.index ["participant_id"], name: "index_participant_clef_tasks_on_participant_id"
  end

  create_table "participants", id: :serial, force: :cascade do |t|
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.boolean "admin", default: false
    t.boolean "verified", default: false
    t.date "verification_date"
    t.string "timezone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unconfirmed_email"
    t.integer "organizer_id"
    t.string "name"
    t.boolean "email_public", default: false
    t.text "bio"
    t.string "website"
    t.string "github"
    t.string "linkedin"
    t.string "twitter"
    t.boolean "account_disabled", default: false
    t.text "account_disabled_reason"
    t.datetime "account_disabled_dttm"
    t.string "slug"
    t.string "api_key"
    t.string "image_file"
    t.string "affiliation"
    t.string "country_cd"
    t.text "address"
    t.string "city"
    t.string "first_name"
    t.string "last_name"
    t.index ["confirmation_token"], name: "index_participants_on_confirmation_token", unique: true
    t.index ["email"], name: "index_participants_on_email", unique: true
    t.index ["organizer_id"], name: "index_participants_on_organizer_id"
    t.index ["reset_password_token"], name: "index_participants_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_participants_on_slug", unique: true
    t.index ["unlock_token"], name: "index_participants_on_unlock_token", unique: true
  end

  create_table "settings", force: :cascade do |t|
    t.boolean "jobs_visible", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "submission_comments", force: :cascade do |t|
    t.bigint "submission_id"
    t.bigint "participant_id"
    t.text "comment_markdown"
    t.text "comment"
    t.integer "vote_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_submission_comments_on_participant_id"
    t.index ["submission_id"], name: "index_submission_comments_on_submission_id"
  end

  create_table "submission_file_definitions", id: :serial, force: :cascade do |t|
    t.integer "challenge_id"
    t.integer "seq"
    t.string "submission_file_description"
    t.string "filetype_cd"
    t.boolean "file_required", default: false
    t.text "submission_file_help_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_submission_file_definitions_on_challenge_id"
  end

  create_table "submission_files", id: :serial, force: :cascade do |t|
    t.integer "submission_id"
    t.integer "seq"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "submission_file_s3_key"
    t.boolean "leaderboard_video", default: false
    t.index ["submission_id"], name: "index_submission_files_on_submission_id"
  end

  create_table "submission_grades", id: :serial, force: :cascade do |t|
    t.integer "submission_id"
    t.string "grading_status_cd"
    t.string "grading_message"
    t.float "grading_factor"
    t.float "score"
    t.float "score_secondary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_submission_grades_on_slug", unique: true
    t.index ["submission_id"], name: "index_submission_grades_on_submission_id"
  end

  create_table "submissions", id: :serial, force: :cascade do |t|
    t.integer "challenge_id"
    t.integer "participant_id"
    t.float "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.float "score_secondary"
    t.string "grading_message"
    t.string "grading_status_cd", default: "ready"
    t.text "description_markdown"
    t.integer "vote_count", default: 0
    t.boolean "post_challenge", default: false
    t.string "api"
    t.string "media_large"
    t.string "media_thumbnail"
    t.string "media_content_type"
    t.integer "challenge_round_id"
    t.json "meta", default: {}
    t.index ["challenge_id"], name: "index_submissions_on_challenge_id"
    t.index ["participant_id"], name: "index_submissions_on_participant_id"
  end

  create_table "submissions_backup_290917", id: false, force: :cascade do |t|
    t.integer "id"
    t.integer "challenge_id"
    t.integer "participant_id"
    t.float "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "description"
    t.float "score_secondary"
    t.string "grading_message"
    t.string "grading_status_cd"
    t.text "description_markdown"
    t.integer "vote_count"
    t.boolean "post_challenge"
    t.string "api"
    t.string "media_large"
    t.string "media_thumbnail"
    t.string "media_content_type"
  end

  create_table "task_dataset_file_downloads", force: :cascade do |t|
    t.bigint "participant_id"
    t.bigint "task_dataset_file_id"
    t.string "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_task_dataset_file_downloads_on_participant_id"
    t.index ["task_dataset_file_id"], name: "index_task_dataset_file_downloads_on_task_dataset_file_id"
  end

  create_table "task_dataset_files", force: :cascade do |t|
    t.bigint "clef_task_id"
    t.integer "seq", default: 0
    t.string "description"
    t.boolean "evaluation", default: false
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "dataset_file_s3_key"
    t.index ["clef_task_id"], name: "index_task_dataset_files_on_clef_task_id"
  end

  create_table "topics", id: :serial, force: :cascade do |t|
    t.integer "challenge_id"
    t.integer "participant_id"
    t.string "topic"
    t.boolean "sticky", default: false
    t.integer "views", default: 0
    t.integer "posts_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "vote_count", default: 0
    t.index ["challenge_id"], name: "index_topics_on_challenge_id"
    t.index ["participant_id"], name: "index_topics_on_participant_id"
    t.index ["slug"], name: "index_topics_on_slug", unique: true
  end

  create_table "versions", id: :serial, force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.integer "votable_id", null: false
    t.string "votable_type", null: false
    t.integer "participant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_votes_on_participant_id"
  end

  add_foreign_key "article_sections", "articles"
  add_foreign_key "articles", "participants"
  add_foreign_key "challenge_rounds", "challenges"
  add_foreign_key "challenges", "organizers"
  add_foreign_key "clef_tasks", "organizers"
  add_foreign_key "comments", "participants"
  add_foreign_key "comments", "topics"
  add_foreign_key "dataset_file_downloads", "dataset_files"
  add_foreign_key "dataset_file_downloads", "participants"
  add_foreign_key "email_preferences", "participants"
  add_foreign_key "follows", "participants"
  add_foreign_key "participant_clef_tasks", "clef_tasks"
  add_foreign_key "participant_clef_tasks", "participants"
  add_foreign_key "participants", "organizers"
  add_foreign_key "submission_comments", "participants"
  add_foreign_key "submission_comments", "submissions"
  add_foreign_key "submission_file_definitions", "challenges"
  add_foreign_key "submission_files", "submissions"
  add_foreign_key "submission_grades", "submissions"
  add_foreign_key "submissions", "challenges"
  add_foreign_key "submissions", "participants"
  add_foreign_key "task_dataset_files", "clef_tasks"
  add_foreign_key "topics", "challenges"
  add_foreign_key "topics", "participants"
  add_foreign_key "votes", "participants"

  create_view "challenge_round_views",  sql_definition: <<-SQL
      SELECT cr.id,
      cr.challenge_round,
      cr.row_num,
      cr.active,
      cr.challenge_id,
      cr.start_dttm,
      cr.end_dttm,
      cr.submission_limit,
      cr.submission_limit_period_cd,
      cr.minimum_score,
      cr.minimum_score_secondary
     FROM ( SELECT r1.id,
              r1.challenge_id,
              r1.challenge_round,
              r1.active,
              r1.created_at,
              r1.updated_at,
              r1.submission_limit,
              r1.submission_limit_period_cd,
              r1.start_dttm,
              r1.end_dttm,
              r1.minimum_score,
              r1.minimum_score_secondary,
              row_number() OVER (PARTITION BY r1.challenge_id ORDER BY r1.challenge_id, r1.start_dttm) AS row_num
             FROM challenge_rounds r1) cr;
  SQL

  create_view "challenge_round_summaries",  sql_definition: <<-SQL
      SELECT cr.id,
      cr.challenge_round,
      cr.row_num,
      acr.row_num AS active_row_num,
          CASE
              WHEN (cr.row_num < acr.row_num) THEN 'history'::text
              WHEN (cr.row_num = acr.row_num) THEN 'current'::text
              WHEN (cr.row_num > acr.row_num) THEN 'future'::text
              ELSE NULL::text
          END AS round_status_cd,
      cr.active,
      cr.challenge_id,
      cr.start_dttm,
      cr.end_dttm,
      cr.submission_limit,
      cr.submission_limit_period_cd,
      cr.minimum_score,
      cr.minimum_score_secondary,
      c.status_cd
     FROM challenge_round_views cr,
      challenge_round_views acr,
      challenges c
    WHERE ((c.id = cr.challenge_id) AND (c.id = acr.challenge_id) AND (acr.active IS TRUE));
  SQL

  create_view "leaderboards",  sql_definition: <<-SQL
      SELECT l.id,
      row_number() OVER (PARTITION BY l.challenge_id, l.challenge_round_id ORDER BY l.score DESC, l.score_secondary) AS row_num,
      l.id AS submission_id,
      l.challenge_id,
      l.challenge_round_id,
      l.participant_id,
      l.slug,
      c.organizer_id,
      l.name,
      l.entries,
      l.score,
      l.score_secondary,
      l.media_large,
      l.media_thumbnail,
      l.media_content_type,
      l.description,
      l.description_markdown,
      l.created_at,
      l.updated_at
     FROM ( SELECT row_number() OVER (PARTITION BY s.challenge_id, s.challenge_round_id, s.participant_id ORDER BY s.score DESC, s.score_secondary) AS submission_ranking,
              s.id,
              s.challenge_id,
              s.challenge_round_id,
              s.participant_id,
              p.slug,
              p.name,
              cnt.entries,
              s.score,
              s.score_secondary,
              s.media_large,
              s.media_thumbnail,
              s.media_content_type,
              s.description,
              s.description_markdown,
              s.created_at,
              s.updated_at
             FROM submissions s,
              participants p,
              ( SELECT c_1.challenge_id,
                      c_1.challenge_round_id,
                      c_1.participant_id,
                      count(c_1.*) AS entries
                     FROM submissions c_1
                    WHERE (c_1.post_challenge = false)
                    GROUP BY c_1.challenge_id, c_1.challenge_round_id, c_1.participant_id) cnt
            WHERE ((p.id = s.participant_id) AND ((s.grading_status_cd)::text = 'graded'::text) AND (cnt.challenge_id = s.challenge_id) AND (cnt.challenge_round_id = s.challenge_round_id) AND (cnt.participant_id = s.participant_id))) l,
      challenges c
    WHERE ((l.submission_ranking = 1) AND (c.id = l.challenge_id))
    ORDER BY l.challenge_id, (row_number() OVER (PARTITION BY l.challenge_id, l.challenge_round_id ORDER BY l.score DESC, l.score_secondary));
  SQL

  create_view "ongoing_leaderboards",  sql_definition: <<-SQL
      SELECT l.id,
      row_number() OVER (PARTITION BY l.challenge_id ORDER BY l.score DESC, l.score_secondary) AS row_num,
      l.id AS submission_id,
      l.challenge_id,
      l.participant_id,
      l.slug,
      c.organizer_id,
      l.name,
      l.entries,
      l.score,
      l.score_secondary,
      l.media_large,
      l.media_thumbnail,
      l.media_content_type,
      l.created_at,
      l.updated_at
     FROM ( SELECT row_number() OVER (PARTITION BY s.challenge_id, s.participant_id ORDER BY s.score DESC, s.score_secondary) AS submission_ranking,
              s.id,
              s.challenge_id,
              s.participant_id,
              p.slug,
              p.name,
              cnt.entries,
              s.score,
              s.score_secondary,
              s.media_large,
              s.media_thumbnail,
              s.media_content_type,
              s.created_at,
              s.updated_at
             FROM submissions s,
              participants p,
              ( SELECT c_1.challenge_id,
                      c_1.participant_id,
                      count(c_1.*) AS entries
                     FROM submissions c_1
                    WHERE (c_1.post_challenge = ANY (ARRAY[true, false]))
                    GROUP BY c_1.challenge_id, c_1.participant_id) cnt
            WHERE ((p.id = s.participant_id) AND ((s.grading_status_cd)::text = 'graded'::text) AND (cnt.challenge_id = s.challenge_id) AND (cnt.participant_id = s.participant_id))) l,
      challenges c
    WHERE ((l.submission_ranking = 1) AND (c.id = l.challenge_id))
    ORDER BY l.challenge_id, (row_number() OVER (PARTITION BY l.challenge_id ORDER BY l.score DESC, l.score_secondary));
  SQL

  create_view "participant_challenge_counts",  sql_definition: <<-SQL
      SELECT row_number() OVER () AS row_number,
      y.challenge_id,
      y.participant_id,
      y.registration_type
     FROM ( SELECT DISTINCT x.challenge_id,
              x.participant_id,
              x.registration_type
             FROM ( SELECT s.challenge_id,
                      s.participant_id,
                      'submission'::text AS registration_type
                     FROM submissions s
                  UNION
                   SELECT s.votable_id,
                      s.participant_id,
                      'heart'::text AS registration_type
                     FROM votes s
                    WHERE ((s.votable_type)::text = 'Challenge'::text)
                  UNION
                   SELECT df.challenge_id,
                      dfd.participant_id,
                      'dataset_download'::text AS text
                     FROM dataset_file_downloads dfd,
                      dataset_files df
                    WHERE (dfd.dataset_file_id = df.id)
                  UNION
                   SELECT c_1.id AS challenge_id,
                      p_1.id AS participant_id,
                      'forum'::text AS registration_type
                     FROM challenges c_1,
                      participants p_1,
                      topics t
                    WHERE ((t.challenge_id = c_1.id) AND (t.participant_id = p_1.id))
                  UNION
                   SELECT t.challenge_id,
                      ps.participant_id,
                      'forum'::text AS registration_type
                     FROM comments ps,
                      topics t
                    WHERE (t.id = ps.topic_id)) x
            ORDER BY x.challenge_id, x.participant_id) y;
  SQL

  create_view "participant_sign_ups",  sql_definition: <<-SQL
      SELECT count(participants.id) AS count,
      (date_part('month'::text, participants.created_at))::integer AS mnth,
      (date_part('year'::text, participants.created_at))::integer AS yr
     FROM participants
    GROUP BY ((date_part('month'::text, participants.created_at))::integer), ((date_part('year'::text, participants.created_at))::integer)
    ORDER BY ((date_part('year'::text, participants.created_at))::integer), ((date_part('month'::text, participants.created_at))::integer);
  SQL

  create_view "participant_submissions",  sql_definition: <<-SQL
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
     FROM participants p,
      (submissions s
       LEFT JOIN submission_files f ON ((f.submission_id = s.id)))
    WHERE (s.participant_id = p.id)
    GROUP BY s.id, s.challenge_id, s.participant_id, p.name, s.grading_status_cd, s.post_challenge, s.score, s.score_secondary, s.created_at
    ORDER BY s.created_at DESC;
  SQL

  create_view "xx",  sql_definition: <<-SQL
      SELECT row_number() OVER () AS id,
      x.challenge_id,
      x.participant_id,
      x.registration_type,
      x.clef_task_id
     FROM ( SELECT s.challenge_id,
              s.participant_id,
              'submission'::text AS registration_type,
              NULL::integer AS clef_task_id
             FROM submissions s
          UNION
           SELECT s.votable_id,
              s.participant_id,
              'heart'::text AS registration_type,
              NULL::integer AS clef_task_id
             FROM votes s
            WHERE ((s.votable_type)::text = 'Challenge'::text)
          UNION
           SELECT df.challenge_id,
              dfd.participant_id,
              'dataset_download'::text,
              NULL::integer AS clef_task_id
             FROM dataset_file_downloads dfd,
              dataset_files df
            WHERE (dfd.dataset_file_id = df.id)
          UNION
           SELECT c_1.id AS challenge_id,
              p_1.id AS participant_id,
              'forum'::text AS registration_type,
              NULL::integer AS clef_task_id
             FROM challenges c_1,
              participants p_1,
              topics t
            WHERE ((t.challenge_id = c_1.id) AND (t.participant_id = p_1.id))
          UNION
           SELECT t.challenge_id,
              ps.participant_id,
              'forum'::text AS registration_type,
              NULL::integer AS clef_task_id
             FROM comments ps,
              topics t
            WHERE (t.id = ps.topic_id)
          UNION
           SELECT c.id,
              pc.participant_id,
              'clef_task'::text AS registration_type,
              pc.clef_task_id
             FROM participant_clef_tasks pc,
              challenges c
            WHERE (c.clef_task_id = pc.clef_task_id)) x;
  SQL

  create_view "challenge_registrations",  sql_definition: <<-SQL
      SELECT row_number() OVER () AS id,
      x.challenge_id,
      x.participant_id,
      x.registration_type,
      x.clef_task_id
     FROM ( SELECT s.challenge_id,
              s.participant_id,
              'submission'::text AS registration_type,
              NULL::integer AS clef_task_id
             FROM submissions s
          UNION
           SELECT s.votable_id,
              s.participant_id,
              'heart'::text AS registration_type,
              NULL::integer AS clef_task_id
             FROM votes s
            WHERE ((s.votable_type)::text = 'Challenge'::text)
          UNION
           SELECT df.challenge_id,
              dfd.participant_id,
              'dataset_download'::text,
              NULL::integer AS clef_task_id
             FROM dataset_file_downloads dfd,
              dataset_files df
            WHERE (dfd.dataset_file_id = df.id)
          UNION
           SELECT c_1.id AS challenge_id,
              p_1.id AS participant_id,
              'forum'::text AS registration_type,
              NULL::integer AS clef_task_id
             FROM challenges c_1,
              participants p_1,
              topics t
            WHERE ((t.challenge_id = c_1.id) AND (t.participant_id = p_1.id))
          UNION
           SELECT t.challenge_id,
              ps.participant_id,
              'forum'::text AS registration_type,
              NULL::integer AS clef_task_id
             FROM comments ps,
              topics t
            WHERE (t.id = ps.topic_id)
          UNION
           SELECT c.id,
              pc.participant_id,
              'clef_task'::text AS registration_type,
              pc.clef_task_id
             FROM participant_clef_tasks pc,
              challenges c
            WHERE (c.clef_task_id = pc.clef_task_id)) x;
  SQL

  create_view "participant_challenges",  sql_definition: <<-SQL
      SELECT DISTINCT p.id,
      cr.challenge_id,
      cr.participant_id,
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
      challenge_registrations cr
    WHERE ((cr.participant_id = p.id) AND (cr.challenge_id = c.id));
  SQL

end
