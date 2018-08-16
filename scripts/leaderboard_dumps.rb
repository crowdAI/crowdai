SeedDump.dump(Submission.where(challenge_round_id: 32),
  file: 'db/tests.rb',
  exclude: [
  :meta,:short_url,:description,:grading_message,:description_markdon,:vote_count,:api,:media_large,:media_thumbnail,:media_content_type,:clef_method_description,:clef_retrieval_type,:clef_run_type,:clef_primary_run,:clef_other_info,:clef_additional,:online_submission]
)

SeedDump.dump(ChallengeRound.where(id: 32), file: 'db/tests.rb', append: true)

SeedDump.dump(Challenge.where(id: 30), file: 'db/tests.rb', append: true)

SeedDump.dump(
  Participant.where(id: Submission.select(:participant_id).where(challenge_round_id: 32)),
  file: 'db/tests.rb', append: true,
  exclude: [
    :email,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :confirmation_token,
    :confirmed_at,
    :confirmation_sent_at,
    :failed_attempts,
    :unlock_token,
    :locked_at,
    :admin,
    :verified,
    :verification_date,
    :timezone,
    :created_at,
    :updated_at,
    :unconfirmed_email,
    :organizer_id,
    :email_public,
    :bio,
    :website,
    :github,
    :linkedin,
    :twitter,
    :account_disabled,
    :account_disabled_reason,
    :account_disabled_dttm,
    :slug,
    :api_key,
    :image_file,
    :affiliation,
    :country_cd,
    :address,
    :city,
    :first_name,
    :last_name,
    :clef_email,
    :sash_id,
    :level
    ])
