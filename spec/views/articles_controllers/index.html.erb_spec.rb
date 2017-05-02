require 'rails_helper'

RSpec.describe "articles_controllers/index", type: :view do
  before(:each) do
    assign(:articles_controllers, [
      ArticlesController.create!(),
      ArticlesController.create!()
    ])
  end

  it "renders a list of articles_controllers" do
    render
  end
end
