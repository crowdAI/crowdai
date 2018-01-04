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

  context 'mentions' do
    describe 'single mention' do
      let!(:comment) { create :comment }
      before do
        comment.comment_markdown = '@sean'
      end
      it { expect(comment.mentions('comment_markdown')).to eq(['sean'])}
    end

    describe 'multiple mentions' do
      let!(:comment) { create :comment }
      before do
        comment.comment_markdown = '@sean blah blah @francis'
      end
      it { expect(comment.mentions('comment_markdown')).to eq(['sean','francis'])}
    end

    describe 'mentioned_participants' do
      context 'single participant' do
        let(:comment) { create :comment }
        let(:participant) { create :participant }
        it { expect(comment.mentioned_participants(mentioned_names: participant.name)).to eq(participant.name) }
      end
      context 'multiple participant' do
        let(:comment) { create :comment }
        let(:participant1) { create :participant }
        let(:participant2) { create :participant }
        it { expect(comment.mentioned_participants(mentioned_names: [participant1.name,participant2.name] )).to eq("#{participant1.name}|#{participant2.name}") }
      end
      context 'missing name' do
        let(:comment) { create :comment }
        let(:participant) { create :participant }
        it { expect(comment.mentioned_participants(mentioned_names: [participant.name,'wrong'] )).to eq("#{participant.name}") }
      end
    end


    describe 'mentions_to_links' do
      let!(:mentions) { ['Sean','joe']}
      let!(:comment) { create :comment, comment_markdown: '@sean blah blah @joe asda' }
      it do
        mentioned_participants = double("mentioned_participants", message: 'Sean|joe|kim')
        expect(comment.mentions_to_links(comment_text: comment_text, mentions: mentions)).to eq('a2333')
      end
    end

  end

=begin
    describe 'do not re-mention if not changed' do
      let!(:comment) { create :comment, comment_markdown: '@sean blah blah @francis' }
      before do
        comment.save
        comment.reload
        comment.comment_markdown = '@sean blah blah, @francis and @joe as well'
      end
      it { expect(comment.mentions('comment_markdown')).to eq(['joe'])}
    end
  end
=end


end
