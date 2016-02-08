require 'rails_helper'

RSpec.describe "hosting_institutions/index", type: :view do
  before(:each) do
    assign(:hosting_institutions, [
      HostingInstitution.create!(
        :institution => "Institution",
        :address => "MyText",
        :description => "MyText",
        :contact_person => "Contact Person",
        :contact_phone => "Contact Phone",
        :contact_email => "Contact Email"
      ),
      HostingInstitution.create!(
        :institution => "Institution",
        :address => "MyText",
        :description => "MyText",
        :contact_person => "Contact Person",
        :contact_phone => "Contact Phone",
        :contact_email => "Contact Email"
      )
    ])
  end

  it "renders a list of hosting_institutions" do
    render
    assert_select "tr>td", :text => "Institution".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Person".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Email".to_s, :count => 2
  end
end
