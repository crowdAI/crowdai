require 'rails_helper'

RSpec.describe "organizers/edit", type: :view do
  before(:each) do
    @organizer = assign(:organizer, Organizer.create!(
      :organizer => "MyString",
      :address => "MyText",
      :description => "MyText",
      :contact_person => "MyString",
      :contact_phone => "MyString",
      :contact_email => "MyString"
    ))
  end

  it "renders the edit organizer form" do
    render

    assert_select "form[action=?][method=?]", organizer_path(@organizer), "post" do

      assert_select "input#organizer_organizer[name=?]", "organizer[organizer]"

      assert_select "textarea#organizer_address[name=?]", "organizer[address]"

      assert_select "textarea#organizer_description[name=?]", "organizer[description]"

      assert_select "input#organizer_contact_person[name=?]", "organizer[contact_person]"

      assert_select "input#organizer_contact_phone[name=?]", "organizer[contact_phone]"

      assert_select "input#organizer_contact_email[name=?]", "organizer[contact_email]"
    end
  end
end
