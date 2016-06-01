class ChallengeView < SqlView
  self.primary_key = :id

  belongs_to :organizer
  has_many :dataset_files
  has_many :events
  has_many :submissions
  has_many :leaderboards
  has_many :participant_challenges
  has_many :topics
  has_one :image, as: :imageable
end


# ChallengeView is in updatable view on the original challenge columns
