require 'rails_helper'

RSpec.describe "article_sections/index", type: :view do
  before(:each) do
    assign(:article_sections, [
      ArticleSection.create!(),
      ArticleSection.create!()
    ])
  end

  it "renders a list of article_sections" do
    render
  end
end
