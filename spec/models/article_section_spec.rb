require 'rails_helper'

describe ArticleSection do
  context 'fields' do
    it { is_expected.to respond_to :seq }
    it { is_expected.to respond_to :description_markdown }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :section }
    it { is_expected.to respond_to :slug }
  end

  context 'associations' do
    it { is_expected.to belong_to(:article) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:section) }
    it { is_expected.to validate_uniqueness_of(:section) }
  end

  context 'methods' do
    it '#cache_rendered_markdown' do
      s = create(:article_section, description_markdown: '# Heading')
      expect(s.description).to eq("<h1>Heading</h1>\n")
    end
    
    it '#should_generate_new_friendly_id?' do
      s = create(:article_section, description_markdown: '# Heading')
      slug = s.slug
      s.update(section: 'new section')
      expect(slug).not_to eq(s.slug)
    end
  end
end
