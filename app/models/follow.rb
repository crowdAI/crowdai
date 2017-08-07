# == Schema Information
#
# Table name: follows
#
#  id              :integer          not null, primary key
#  followable_id   :integer          not null
#  followable_type :string           not null
#  participant_id  :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_follows_on_participant_id  (participant_id)
#
# Foreign Keys
#
#  fk_rails_...  (participant_id => participants.id)
#

class Follow < ApplicationRecord
  belongs_to :followable, polymorphic: true
  belongs_to :participant
end
