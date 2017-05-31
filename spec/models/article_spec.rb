require 'rails_helper'

describe Article do
  context 'fields' do
    it { is_expected.to respond_to :article }
    it { is_expected.to respond_to :summary }
    it { is_expected.to respond_to :published }
    it { is_expected.to respond_to :vote_count }
    it { is_expected.to respond_to :view_count }
    it { is_expected.to respond_to :slug }
    it { is_expected.to respond_to :image_file }
    it { is_expected.to respond_to :category }
    it { is_expected.to respond_to :image_file }
  end

  context 'associations' do
    it { is_expected.to belong_to(:participant) }
    it { is_expected.to have_many(:votes) }
    it { is_expected.to have_many(:article_sections).dependent(:destroy) }
    it { is_expected.to accept_nested_attributes_for :article_sections }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:participant_id) }
    it { is_expected.to validate_presence_of(:article) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:summary) }
    it { is_expected.to validate_presence_of(:view_count) }
    it { is_expected.to validate_presence_of(:vote_count) }
  end

  context 'methods' do
    describe '#record_page_view' do
      it 'returns 1 for the first view' do
        article = build(:article)
        article.record_page_view
        expect(article.view_count).to eq(1)
      end

      it 'returns 3 for the third view' do
        article = build(:article)
        3.times { article.record_page_view }
        expect(article.view_count).to eq(3)
      end

      it '#should_generate_new_friendly_id?' do
        s = create(:article)
        slug = s.slug
        s.update(article: 'new title')
        expect(slug).not_to eq(s.slug)
      end
    end
  end
end
