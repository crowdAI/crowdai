class ChallengeRound < ApplicationRecord
  extend TimeSplitter::Accessors
  split_accessor :start_dttm, :end_dttm, time_format: "%I:%M%p"
  belongs_to :challenge
  after_initialize :defaults, unless: :persisted?

  validates_presence_of     :challenge_round
  validates_numericality_of :submission_limit,
                            only_integer: true,
                            greater_than_or_equal_to: 1,
                            allow_nil: true
  validates_uniqueness_of :challenge_round,
                          scope: :challenge_id, case_sensitive: false

  as_enum :submission_limit_period, [:day, :round], map: :string

  default_scope { order :start_dttm }

  def defaults
    self.challenge_round ||= 'Round 1'
  end

end
