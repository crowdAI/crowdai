require 'rails_helper'

RSpec.describe "article_sections/show", type: :view do
  before(:each) do
    @article_section = assign(:article_section, ArticleSection.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
