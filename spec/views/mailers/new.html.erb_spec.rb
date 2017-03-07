require 'rails_helper'

RSpec.describe "mailers/new", type: :view do
  before(:each) do
    assign(:mailer, Mailer.new(
      :mailer => "MyString",
      :paused => false
    ))
  end

  it "renders new mailer form" do
    render

    assert_select "form[action=?][method=?]", mailers_path, "post" do

      assert_select "input#mailer_mailer[name=?]", "mailer[mailer]"

      assert_select "input#mailer_paused[name=?]", "mailer[paused]"
    end
  end
end
