require 'rails_helper'

RSpec.describe "article_sections/new", type: :view do
  before(:each) do
    assign(:article_section, ArticleSection.new())
  end

  it "renders new article_section form" do
    render

    assert_select "form[action=?][method=?]", article_sections_path, "post" do
    end
  end
end
