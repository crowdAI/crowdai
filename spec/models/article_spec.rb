require 'rails_helper'

describe Article do

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
