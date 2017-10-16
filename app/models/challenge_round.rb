class ChallengeRound < ApplicationRecord
  belongs_to :challenge
  before_save :set_datetimes
  after_initialize :defaults, unless: :persisted?

  validates_presence_of     :challenge_round
  validates_presence_of     :start_date
  validates_presence_of     :end_date
  validates_presence_of     :start_time
  validates_presence_of     :end_time
  validates_numericality_of :submission_limit,
                            only_integer: true,
                            greater_than_or_equal_to: 1,
                            allow_nil: true
  validates_uniqueness_of :challenge_round,
                          scope: :challenge_id, case_sensitive: false
  validates_uniqueness_of :start_date, scope: :challenge_id
  validates_uniqueness_of :end_date, scope: :challenge_id

  as_enum :submission_limit_period, [:day, :round], map: :string

  default_scope { order :start_dttm }

  def defaults
    self.challenge_round ||= 'Round 1'
  end

  def set_datetimes
    if start_date_changed? || start_time_changed?
      self.start_dttm = start_date.to_datetime + start_time.seconds_since_midnight.seconds
    end
    if end_date_changed? || end_time_changed?
      self.end_dttm = end_date.to_datetime + end_time.seconds_since_midnight.seconds
    end
  end

end
