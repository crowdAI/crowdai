require 'rails_helper'

RSpec.describe "articles/show", type: :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      :article => "Article",
      :participant => nil,
      :published => false,
      :vote_count => 1,
      :category => "Category",
      :view_count => 2,
      :comment_count => 3,
      :summary => "Summary",
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Article/)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Summary/)
    expect(rendered).to match(/Slug/)
  end
end
