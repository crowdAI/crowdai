require 'rails_helper'

RSpec.describe "hosting_institutions/show", type: :view do
  before(:each) do
    @hosting_institution = assign(:hosting_institution, HostingInstitution.create!(
      :institution => "Institution",
      :address => "MyText",
      :description => "MyText",
      :contact_person => "Contact Person",
      :contact_phone => "Contact Phone",
      :contact_email => "Contact Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Institution/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Contact Person/)
    expect(rendered).to match(/Contact Phone/)
    expect(rendered).to match(/Contact Email/)
  end
end
