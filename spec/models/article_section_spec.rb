require 'rails_helper'

describe ArticleSection do
  context 'methods' do
    it '#cache_rendered_markdown' do
      s = create(:article_section, description_markdown: '# Heading')
      expect(s.description).to eq("<h1 id=\"heading\">Heading</h1>\n")
    end

    it '#should_generate_new_friendly_id?' do
      s = create(:article_section, description_markdown: '# Heading')
      slug = s.slug
      s.update(section: 'new section')
      expect(slug).not_to eq(s.slug)
    end
  end
end
