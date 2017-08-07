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

FactoryGirl.define do
  factory :follow, class: Follow do
    association :followable, factory: :challenge
    participant
  end
end
