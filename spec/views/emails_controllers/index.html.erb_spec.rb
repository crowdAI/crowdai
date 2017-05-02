require 'rails_helper'

RSpec.describe "emails_controllers/index", type: :view do
  before(:each) do
    assign(:emails_controllers, [
      EmailsController.create!(),
      EmailsController.create!()
    ])
  end

  it "renders a list of emails_controllers" do
    render
  end
end
