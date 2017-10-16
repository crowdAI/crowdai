class ChallengeRoundSummary < ApplicationRecord
  include SqlView
  belongs_to :challenge
  as_enum :status, [:draft, :running, :completed, :terminated, :starting_soon], map: :string
  as_enum :round_status, [:history, :current, :future], map: :string
end
