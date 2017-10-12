class Stage < ApplicationRecord
  belongs_to :challenge
  after_initialize :defaults, unless: :persisted?

  validates_presence_of   :stage
  validates_presence_of   :start_date
  validates_presence_of   :end_date
  validates_presence_of   :start_time
  validates_presence_of   :end_time
  validates_presence_of   :leaderboard_title

  validates_uniqueness_of :stage,
                          scope: :challenge_id, case_sensitive: false
  validates_uniqueness_of :start_date, scope: :challenge_id
  validates_uniqueness_of :end_date, scope: :challenge_id
  validates_uniqueness_of :leaderboard_title,
                          scope: :challenge_id, case_sensitive: false

  default_scope { order :seq }

  def defaults
    self.stage ||= 'Round 1'
    self.leaderboard_title ||= 'Leaderboard'
  end
end
