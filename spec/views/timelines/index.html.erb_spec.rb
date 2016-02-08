require 'rails_helper'

RSpec.describe "timelines/index", type: :view do
  before(:each) do
    assign(:timelines, [
      Timeline.create!(
        :competition => nil,
        :seq => 1,
        :event => "Event"
      ),
      Timeline.create!(
        :competition => nil,
        :seq => 1,
        :event => "Event"
      )
    ])
  end

  it "renders a list of timelines" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Event".to_s, :count => 2
  end
end
