require 'rails_helper'

describe Article do
  context 'fields' do
    it { is_expected.to respond_to :article }
    it { is_expected.to respond_to :summary }
    it { is_expected.to respond_to :published }
    it { is_expected.to respond_to :vote_count }
    it { is_expected.to respond_to :view_count }

  end

  context 'associations' do
    it { should belong_to(:participant) }
    it { should have_one(:image).dependent(:destroy) }
    it { is_expected.to accept_nested_attributes_for :image }
    it { should have_many(:votes) }
    it { should have_many(:article_sections).dependent(:destroy) }
    it { is_expected.to accept_nested_attributes_for :article_sections }
  end

  context 'validations' do
    it { should validate_presence_of(:participant_id) }
    it { should validate_presence_of(:article) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:view_count) }
    it { should validate_presence_of(:vote_count) }
  end

  context 'methods' do
    describe '#image_medium_url' do
      it 'works' do
        article = Article.new
        result = article.image_medium_url
        expect(result).not_to be_nil
      end
    end

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
    end
  end
end
