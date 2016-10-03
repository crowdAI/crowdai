require 'rails_helper'

describe ArticleSection do
  context 'associations' do
    it { should belong_to(:article) }
  end

  context 'validations' do
    it { should validate_presence_of(:icon) }
    it { should validate_presence_of(:section) }
    it { should validate_uniqueness_of(:section) }
  end

  context 'methods' do
    it '#cache_rendered_markdown' do
      s = create(:article_section, description_markdown: '# Heading')
      expect(s.description).to eq("<h1>Heading</h1>\n")
    end
  end
end
