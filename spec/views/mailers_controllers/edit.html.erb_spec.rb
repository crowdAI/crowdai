require 'rails_helper'

RSpec.describe "mailers_controllers/edit", type: :view do
  before(:each) do
    @mailers_controller = assign(:mailers_controller, MailersController.create!())
  end

  it "renders the edit mailers_controller form" do
    render

    assert_select "form[action=?][method=?]", mailers_controller_path(@mailers_controller), "post" do
    end
  end
end
