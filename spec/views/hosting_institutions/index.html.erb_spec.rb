require 'rails_helper'

RSpec.describe "organizers/index", type: :view do
  before(:each) do
    assign(:organizers, [
      Organizer.create!(
        :organizer => "organizer",
        :address => "MyText",
        :description => "MyText",
        :contact_person => "Contact Person",
        :contact_phone => "Contact Phone",
        :contact_email => "Contact Email"
      ),
      Organizer.create!(
        :organizer => "organizer",
        :address => "MyText",
        :description => "MyText",
        :contact_person => "Contact Person",
        :contact_phone => "Contact Phone",
        :contact_email => "Contact Email"
      )
    ])
  end

  it "renders a list of organizers" do
    render
    assert_select "tr>td", :text => "organizer".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Person".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Email".to_s, :count => 2
  end
end
