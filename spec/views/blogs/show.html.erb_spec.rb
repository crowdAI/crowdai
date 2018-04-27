require 'rails_helper'

RSpec.describe "blogs/show", type: :view do
  before(:each) do
    @blog = assign(:blog, Blog.create!(
      :participant => nil,
      :title => "Title",
      :body => "MyText",
      :published => false,
      :vote_count => 2,
      :view_count => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
