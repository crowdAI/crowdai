require 'rails_helper'

RSpec.describe "organizer_applications/edit", type: :view do
  before(:each) do
    @organizer_application = assign(:organizer_application, OrganizerApplication.create!(
      :contact_name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :organization => "MyString",
      :organization_description => "MyString",
      :challenge_description => "MyString"
    ))
  end

  it "renders the edit organizer_application form" do
    render

    assert_select "form[action=?][method=?]", organizer_application_path(@organizer_application), "post" do

      assert_select "input#organizer_application_contact_name[name=?]", "organizer_application[contact_name]"

      assert_select "input#organizer_application_email[name=?]", "organizer_application[email]"

      assert_select "input#organizer_application_phone[name=?]", "organizer_application[phone]"

      assert_select "input#organizer_application_organization[name=?]", "organizer_application[organization]"

      assert_select "input#organizer_application_organization_description[name=?]", "organizer_application[organization_description]"

      assert_select "input#organizer_application_challenge_description[name=?]", "organizer_application[challenge_description]"
    end
  end
end
