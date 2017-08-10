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
#
# Indexes
#
#  index_votes_on_participant_id  (participant_id)
#
# Foreign Keys
#
#  fk_rails_...  (participant_id => participants.id)
#

class Vote < ApplicationRecord
  belongs_to :votable, :polymorphic => true
  belongs_to :participant, optional: true
end
