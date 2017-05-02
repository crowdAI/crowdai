require 'rails_helper'

RSpec.describe "mailers_controllers/index", type: :view do
  before(:each) do
    assign(:mailers_controllers, [
      MailersController.create!(),
      MailersController.create!()
    ])
  end

  it "renders a list of mailers_controllers" do
    render
  end
end
