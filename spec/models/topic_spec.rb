# == Schema Information
#
# Table name: topics
#
#  id             :integer          not null, primary key
#  challenge_id   :integer
#  participant_id :integer
#  topic          :string
#  sticky         :boolean          default(FALSE)
#  views          :integer          default(0)
#  posts_count    :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  slug           :string
#  vote_count     :integer          default(0)
#
# Indexes
#
#  index_topics_on_challenge_id    (challenge_id)
#  index_topics_on_participant_id  (participant_id)
#  index_topics_on_slug            (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (challenge_id => challenges.id)
#  fk_rails_...  (participant_id => participants.id)
#

require 'rails_helper'

describe Topic do
  context 'fields' do
    it { is_expected.to respond_to :topic }
    it { is_expected.to respond_to :views }
    it { is_expected.to respond_to :vote_count }
  end

  context 'associations' do
    it { is_expected.to belong_to(:challenge) }
    it { is_expected.to belong_to(:participant) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end

  context 'indexes' do
    it { is_expected.to have_db_index ["challenge_id"] }
    it { is_expected.to have_db_index ["participant_id"] }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:topic) }
    it { is_expected.to validate_length_of(:topic).is_at_most(255) }
  end

end
