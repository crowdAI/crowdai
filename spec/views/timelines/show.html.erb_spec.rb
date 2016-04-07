require 'rails_helper'

RSpec.describe "timelines/show", type: :view do
  before(:each) do
    @timeline = assign(:timeline, Timeline.create!(
      :challenge => nil,
      :seq => 1,
      :event => "Event"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Event/)
  end
end
