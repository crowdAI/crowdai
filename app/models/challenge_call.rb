class ChallengeCall < ApplicationRecord
  include FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]
  has_many :challenge_call_responses

  def should_generate_new_friendly_id?
    title_changed?
  end
end
