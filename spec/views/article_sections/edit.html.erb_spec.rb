require 'rails_helper'

RSpec.describe "article_sections/edit", type: :view do
  before(:each) do
    @article_section = assign(:article_section, ArticleSection.create!())
  end

  it "renders the edit article_section form" do
    render

    assert_select "form[action=?][method=?]", article_section_path(@article_section), "post" do
    end
  end
end
