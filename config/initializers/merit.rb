Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true
  config.orm = :active_record
  config.user_model_name = 'Participant'
  config.current_user_method = 'current_participant'
end

challenge_winner = [
  {
    id: 1,
    name: 'winner-gold',
    description: 'Awarded for winning 3 challenges',
    level: 3,
    custom_fields: {
      title: 'Challenge winner: Gold',
      level: 'gold'
    }
  },
  {
    id: 2,
    name: 'winner-silver',
    description: 'Awarded for winning 2 challenges',
    level: 2,
    custom_fields: {
      title: 'Challenge winner: Silver',
      level: 'silver'
    }
  },
  {
    id: 3,
    name: 'winner-bronze',
    description: 'Awarded for winning a challenge',
    level: 1,
    custom_fields: {
      title: 'Challenge winner: Bronze',
      level: 'bronze'
    }
  }
]

challenge_submissions = [
  {
    id: 4,
    name: 'submissions-gold',
    description: 'Awarded for 1,000 submissions',
    level: 3,
    custom_fields: {
      title: 'Challenge submissions: Gold',
      level: 'gold'
    }
  },
  {
    id: 5,
    name: 'submissions-silver',
    description: 'Awarded for 100 submissions',
    level: 2,
    custom_fields: {
      title: 'Challenge submissions: Silver',
      level: 'silver'
    }
  },
  {
    id: 6,
    name: 'submissions-bronze',
    description: 'Awarded for first submission',
    level: 1,
    custom_fields: {
      title: 'Challenge submissions: Bronze',
      level: 'bronze'
    }
  }
]

top_position = [
  {
    id: 7,
    name: 'top-position-gold',
    description: 'Awarded for top position during a challenge 25 times',
    level: 3,
    custom_fields: {
      title: 'Top position during challenge: Gold',
      level: 'gold'
    }
  },
  {
    id: 8,
    name: 'top-position-silver',
    description: 'Awarded for top position during a challenge 5 times',
    level: 2,
    custom_fields: {
      title: 'Top position during challenge: Silver',
      level: 'silver'
    }
  },
  {
    id: 9,
    name: 'top-position-bronze',
    description: 'Awarded for top position during a challenge',
    level: 1,
    custom_fields: {
      title: 'Top position during challenge: Bronze',
      level: 'bronze'
    }
  }
]

upvotes = [
  {
    id: 10,
    name: 'upvote-gold',
    description: 'Awarded for receiving 250 upvotes on a comment or tutorial',
    level: 3,
    custom_fields: {
      title: 'Upvote: Gold',
      level: 'gold'
    }
  },
  {
    id: 11,
    name: 'upvote-silver',
    description: 'Awarded for receiving 25 upvotes on a comment or tutorial',
    level: 2,
    custom_fields: {
      title: 'Upvote: Silver',
      level: 'silver'
    }
  },
  {
    id: 12,
    name: 'upvote-bronze',
    description: 'Awarded for receiving an upvote on a comment or tutorial',
    level: 1,
    custom_fields: {
      title: 'Upvote: Bronze',
      level: 'bronze'
    }
  }
]

tutorials = [
  {
    id: 13,
    name: 'tutorial-gold',
    description: 'Awarded for writing 30 tutorials',
    level: 3,
    custom_fields: {
      title: 'Tutorial authorship: Gold',
      level: 'gold'
    }
  },
  {
    id: 14,
    name: 'tutorial-silver',
    description: 'Awarded for writing 3 tutorials',
    level: 2,
    custom_fields: {
      title: 'Tutorial authorship: Silver',
      level: 'silver'
    }
  },
  {
    id: 15,
    name: 'tutorial-bronze',
    description: 'Awarded for writing a tutorial',
    level: 1,
    custom_fields: {
      title: 'Tutorial authorship: Bronze',
      level: 'bronze'
    }
  }
]

top5_during = [
  {
    id: 16,
    name: 'top5-during-gold',
    description: 'Awarded for top position during a challenge 25 times',
    level: 3,
    custom_fields: {
      title: 'Top 5 during a challenge: Gold',
      level: 'bronze'
    }
  },
  {
    id: 17,
    name: 'top5-during-silver',
    description: 'Awarded for top position during a challenge 5 times',
    level: 2,
    custom_fields: {
      title: 'Top 5 during a challenge: Silver',
      level: 'silver'
    }
  },
  {
    id: 18,
    name: 'top5-during-bronze',
    description: 'Awarded for being in the top 5 on a leaderboard during a challenge',
    level: 1,
    custom_fields: {
      title: 'Top 5 during a challenge: Bronze',
      level: 'bronze'
    }
  }
]


top5_completed = [
  {
    id: 19,
    name: 'top5-completed-gold',
    description: 'Awarded for finishing in the top 5 on a leaderboard for a completed challenge 3 times',
    level: 3,
    custom_fields: {
      title: 'Top 5 for completed challenge: Gold',
      level: 'gold'
    }
  },
  {
    id: 20,
    name: 'top5-completed-silver',
    description: 'Awarded for top position during a challenge 5 times',
    level: 2,
    custom_fields: {
      title: 'Top 5 for completed challenge: Silver',
      level: 'silver'
    }
  },
  {
    id: 21,
    name: 'top5-completed-bronze',
    description: 'Awarded for finishing in the top 5 on a leaderboard for a completed challenge',
    level: 1,
    custom_fields: {
      title: 'Top 5 for completed challenge: Bronze',
      level: 'bronze'
    }
  }
]

top10_completed = [
  {
    id: 22,
    name: 'top10-completed-gold',
    description: 'Awarded for finishing in the top 10 on a leaderboard for a completed challenge 20 times',
    level: 3,
    custom_fields: {
      title: 'Top 10 for completed challenge: Gold',
      level: 'gold'
    }
  },
  {
    id: 23,
    name: 'top10-completed-silver',
    description: 'Awarded for finishing in the top 10 on a leaderboard for a completed challenge 5 times',
    level: 2,
    custom_fields: {
      title: 'Top 10 for completed challenge: Silver',
      level: 'silver'
    }
  },
  {
    id: 24,
    name: 'top10-completed-bronze',
    description: 'Awarded for finishing in the top 10 on a leaderboard for a completed challenge',
    level: 1,
    custom_fields: {
      title: 'Top 10 for completed challenge: Bronze',
      level: 'bronze'
    }
  }
]

badges = challenge_winner + challenge_submissions + top_position + upvotes + tutorials + top5_during + top5_completed + top10_completed

badges.each do |badge|
  Merit::Badge.create!(badge)
end
