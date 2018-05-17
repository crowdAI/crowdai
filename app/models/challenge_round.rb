class ChallengeRound < ApplicationRecord
  belongs_to :challenge
  has_many :submissions,
    dependent: :restrict_with_error
  after_initialize :defaults,
    unless: :persisted?

  validates_presence_of :challenge_round
  validates_numericality_of :submission_limit,
    only_integer: true,
    greater_than_or_equal_to: 1,
    allow_nil: true
  validates_numericality_of :ranking_window,
    only_integer: true,
    greater_than_or_equal_to: 1,
    allow_nil: true
  validates_numericality_of :ranking_highlight,
    only_integer: true,
    greater_than_or_equal_to: 1,
    allow_nil: true
  validates_numericality_of :score_precision,
    only_integer: true,
    greater_than_or_equal_to: 1,
    allow_nil: true
  validates_numericality_of :score_secondary_precision,
    only_integer: true,
    greater_than_or_equal_to: 1,
    allow_nil: true

  validate :validate_period_and_duration

  def validate_period_and_duration
    unless (submission_limit.blank? &&
            submission_limit_period.blank?) ||
            (submission_limit.present? &&
            submission_limit_period.present?)
      errors.add(:submission_limit,"Complete both submission Limit and period or neither.")
    end
  end

  as_enum :submission_limit_period,
    [:day, :week, :round], map: :string

  default_scope { order :start_dttm }

  def defaults
    self.challenge_round ||= 'Round 1'
    self.ranking_window ||= 96
    self.ranking_highlight ||= 3
    self.score_precision ||= 3
    self.score_secondary_precision ||= 3
  end

end
