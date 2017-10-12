class ChallengeRound < ApplicationRecord
  belongs_to :challenge
  after_initialize :defaults, unless: :persisted?

  validates_presence_of   :challenge_round
  validates_presence_of   :start_date
  validates_presence_of   :end_date
  validates_presence_of   :start_time
  validates_presence_of   :end_time

  validates_uniqueness_of :challenge_round,
                          scope: :challenge_id, case_sensitive: false
  validates_uniqueness_of :start_date, scope: :challenge_id
  validates_uniqueness_of :end_date, scope: :challenge_id

  default_scope { order :seq }

  def defaults
    self.challenge_round ||= 'Round 1'
  end
end
