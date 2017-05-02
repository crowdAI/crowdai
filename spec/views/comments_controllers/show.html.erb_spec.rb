require 'rails_helper'

RSpec.describe "comments_controllers/show", type: :view do
  before(:each) do
    @comments_controller = assign(:comments_controller, CommentsController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
