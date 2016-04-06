require 'rails_helper'

RSpec.describe "timelines/new", type: :view do
  before(:each) do
    assign(:timeline, Timeline.new(
      :challenge => nil,
      :seq => 1,
      :event => "MyString"
    ))
  end

  it "renders new timeline form" do
    render

    assert_select "form[action=?][method=?]", timelines_path, "post" do

      assert_select "input#timeline_challenge_id[name=?]", "timeline[challenge_id]"

      assert_select "input#timeline_seq[name=?]", "timeline[seq]"

      assert_select "input#timeline_event[name=?]", "timeline[event]"
    end
  end
end
