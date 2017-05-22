# == Schema Information
#
# Table name: votes
#
#  id             :integer          not null, primary key
#  votable_id     :integer          not null
#  votable_type   :string           not null
#  participant_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  slug           :string
#
# Indexes
#
#  index_votes_on_participant_id  (participant_id)
#  index_votes_on_slug            (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_7d535390f0  (participant_id => participants.id)
#

class Vote < ApplicationRecord
  belongs_to :votable, :polymorphic => true
  belongs_to :participant
end
