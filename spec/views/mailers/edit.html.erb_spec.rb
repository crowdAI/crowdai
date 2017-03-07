require 'rails_helper'

RSpec.describe "mailers/edit", type: :view do
  before(:each) do
    @mailer = assign(:mailer, Mailer.create!(
      :mailer => "MyString",
      :paused => false
    ))
  end

  it "renders the edit mailer form" do
    render

    assert_select "form[action=?][method=?]", mailer_path(@mailer), "post" do

      assert_select "input#mailer_mailer[name=?]", "mailer[mailer]"

      assert_select "input#mailer_paused[name=?]", "mailer[paused]"
    end
  end
end
