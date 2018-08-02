# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  config.user_model_name = 'Participant'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  config.current_user_method = 'current_participant'
end

# Submissions
Merit::Badge.create!(
  id: 1,
  name: "submission-bronze",
  description: "First submission made",
  custom_fields: { difficulty: :bronze }
)

Merit::Badge.create!(
  id: 2,
  name: "submission-silver",
  description: "100 submissions made",
  custom_fields: { difficulty: :silver }
)

Merit::Badge.create!(
  id: 3,
  name: "submission-gold",
  description: "1000 submissions made",
  custom_fields: { difficulty: :gold }
)

# Votes
Merit::Badge.create!(
  id: 4,
  name: "votes-bronze",
  description: "First submission received",
  custom_fields: { difficulty: :bronze }
)

Merit::Badge.create!(
  id: 5,
  name: "votes-silver",
  description: "25 votes received",
  custom_fields: { difficulty: :silver }
)

Merit::Badge.create!(
  id: 6,
  name: "votes-gold",
  description: "250 votes received",
  custom_fields: { difficulty: :gold }
)

# Top 1 on leaderboard during challenge
Merit::Badge.create!(
  id: 7,
  name: "top-1-during-bronze",
  description: "First on a leaderboard x1",
  custom_fields: { difficulty: :bronze }
)

Merit::Badge.create!(
  id: 8,
  name: "top-1-during-silver",
  description: "First on a leaderboard x5",
  custom_fields: { difficulty: :silver }
)

Merit::Badge.create!(
  id: 9,
  name: "top-1-during-gold",
  description: "First on a leaderboard x25",
  custom_fields: { difficulty: :gold }
)

# Top 5 on leaderboard during challenge
Merit::Badge.create!(
  id: 10,
  name: "top-5-during-bronze",
  description: "Leaderboard top 5 x1",
  custom_fields: { difficulty: :bronze }
)

Merit::Badge.create!(
  id: 11,
  name: "top-5-during-silver",
  description: "Leaderboard top 5 x5",
  custom_fields: { difficulty: :silver }
)

Merit::Badge.create!(
  id: 12,
  name: "top-5-during-gold",
  description: "Leaderboard top 5 x25",
  custom_fields: { difficulty: :gold }
)

# Authored a tutorial
Merit::Badge.create!(
  id: 13,
  name: "tutorial-bronze",
  description: "First tutorial",
  custom_fields: { difficulty: :bronze }
)

Merit::Badge.create!(
  id: 14,
  name: "tutorial-silver",
  description: "Authored 3 tutorials",
  custom_fields: { difficulty: :silver }
)

Merit::Badge.create!(
  id: 15,
  name: "tutorial-gold",
  description: "Authored 30 tutorials",
  custom_fields: { difficulty: :gold }
)

# Top 1 for a completed challenge
Merit::Badge.create!(
  id: 16,
  name: "top-1-bronze",
  description: "Challenge winner",
  custom_fields: { difficulty: :bronze }
)

Merit::Badge.create!(
  id: 17,
  name: "top-1-silver",
  description: "Challenge winner - 2 times",
  custom_fields: { difficulty: :silver }
)

Merit::Badge.create!(
  id: 18,
  name: "top-1-gold",
  description: "Challenge winner 3 or more times",
  custom_fields: { difficulty: :gold }
)

# Top 5 for a completed challenge
Merit::Badge.create!(
  id: 19,
  name: "top-5-bronze",
  description: "In the top 5 for a challenge",
  custom_fields: { difficulty: :bronze }
)

Merit::Badge.create!(
  id: 20,
  name: "top-5-silver",
  description: "In the top 5 for a challenge - 3 times",
  custom_fields: { difficulty: :silver }
)

Merit::Badge.create!(
  id: 21,
  name: "top-5-gold",
  description: "In the top 5 for a challenge - 10 times",
  custom_fields: { difficulty: :gold }
)

# Top 10 for a completed challenge
Merit::Badge.create!(
  id: 22,
  name: "top-10-bronze",
  description: "In the top 10 for a challenge",
  custom_fields: { difficulty: :bronze }
)

Merit::Badge.create!(
  id: 23,
  name: "top-10-silver",
  description: "In the top 10 for a challenge - 5 times",
  custom_fields: { difficulty: :silver }
)

Merit::Badge.create!(
  id: 24,
  name: "top-5-gold",
  description: "In the top 10 for a challenge - 20 times",
  custom_fields: { difficulty: :gold }
)

Merit::Badge.create!(
  id: 25,
  name: 'participant'
)
