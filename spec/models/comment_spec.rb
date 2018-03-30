require 'rails_helper'

describe Comment do
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

  context 'methods' do
    describe 'validate markdown fields' do
      let(:comment) { create :comment }
      it 'description' do
        comment.update!(comment_markdown: '### The description')
        expect(comment.comment).to eq("<h3 id=\"the-description\">The description</h3>\n")
      end
    end
  end

end
