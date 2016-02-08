require 'rails_helper'

RSpec.describe "timelines/edit", type: :view do
  before(:each) do
    @timeline = assign(:timeline, Timeline.create!(
      :competition => nil,
      :seq => 1,
      :event => "MyString"
    ))
  end

  it "renders the edit timeline form" do
    render

    assert_select "form[action=?][method=?]", timeline_path(@timeline), "post" do

      assert_select "input#timeline_competition_id[name=?]", "timeline[competition_id]"

      assert_select "input#timeline_seq[name=?]", "timeline[seq]"

      assert_select "input#timeline_event[name=?]", "timeline[event]"
    end
  end
end
