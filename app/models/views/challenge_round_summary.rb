class ChallengeRoundSummary < SqlView
  self.primary_key = :id
  after_initialize :readonly!

  belongs_to :challenge
  as_enum :status, [:draft, :running, :completed, :terminated, :starting_soon], map: :string
  as_enum :round_status, [:history, :current, :future], map: :string
  as_enum :submission_limit_period, [:day, :round], map: :string
end
