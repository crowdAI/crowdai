require 'rails_helper'

RSpec.describe "organizer_applications/show", type: :view do
  before(:each) do
    @organizer_application = assign(:organizer_application, OrganizerApplication.create!(
      :contact_name => "Contact Name",
      :email => "Email",
      :phone => "Phone",
      :organization => "Organization",
      :organization_description => "Organization Description",
      :challenge_description => "Challenge Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Contact Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Organization/)
    expect(rendered).to match(/Organization Description/)
    expect(rendered).to match(/Challenge Description/)
  end
end
