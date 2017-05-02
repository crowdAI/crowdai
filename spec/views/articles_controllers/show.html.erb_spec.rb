require 'rails_helper'

RSpec.describe "articles_controllers/show", type: :view do
  before(:each) do
    @articles_controller = assign(:articles_controller, ArticlesController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
