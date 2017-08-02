require 'rails_helper'

RSpec.describe "organizer_applications/index", type: :view do
  before(:each) do
    assign(:organizer_applications, [
      OrganizerApplication.create!(
        :contact_name => "Contact Name",
        :email => "Email",
        :phone => "Phone",
        :organization => "Organization",
        :organization_description => "Organization Description",
        :challenge_description => "Challenge Description"
      ),
      OrganizerApplication.create!(
        :contact_name => "Contact Name",
        :email => "Email",
        :phone => "Phone",
        :organization => "Organization",
        :organization_description => "Organization Description",
        :challenge_description => "Challenge Description"
      )
    ])
  end

  it "renders a list of organizer_applications" do
    render
    assert_select "tr>td", :text => "Contact Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Organization".to_s, :count => 2
    assert_select "tr>td", :text => "Organization Description".to_s, :count => 2
    assert_select "tr>td", :text => "Challenge Description".to_s, :count => 2
  end
end
