require 'rails_helper'

RSpec.describe "emails_controllers/edit", type: :view do
  before(:each) do
    @emails_controller = assign(:emails_controller, EmailsController.create!())
  end

  it "renders the edit emails_controller form" do
    render

    assert_select "form[action=?][method=?]", emails_controller_path(@emails_controller), "post" do
    end
  end
end
