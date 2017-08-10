# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  topic_id         :integer
#  participant_id   :integer
#  comment          :text
#  flagged          :boolean          default(FALSE)
#  notify           :boolean          default(TRUE)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  vote_count       :integer          default(0)
#  slug             :string
#  comment_markdown :text
#
# Indexes
#
#  index_posts_on_participant_id  (participant_id)
#  index_posts_on_slug            (slug) UNIQUE
#  index_posts_on_topic_id        (topic_id)
#
# Foreign Keys
#
#  fk_rails_...  (participant_id => participants.id)
#  fk_rails_...  (topic_id => topics.id)
#

require 'rails_helper'

describe Comment do
  context 'fields' do
    it { is_expected.to respond_to :slug }
    it { is_expected.to respond_to :vote_count }
    it { is_expected.to respond_to :comment }
    it { is_expected.to respond_to :comment_markdown }
  end

  context 'associations' do
    it { is_expected.to belong_to(:topic) }
    it { is_expected.to belong_to(:participant) }
    it { is_expected.to have_many(:votes) }
  end

  context 'indexes' do
    it { is_expected.to have_db_index ["topic_id"] }
    it { is_expected.to have_db_index ["participant_id"] }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:vote_count) }
  end
end
