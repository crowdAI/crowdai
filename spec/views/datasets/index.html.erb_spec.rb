require 'rails_helper'

RSpec.describe "datasets/index", type: :view do
  before(:each) do
    assign(:datasets, [
      Dataset.create!(
        :competition => nil,
        :description => "MyText"
      ),
      Dataset.create!(
        :competition => nil,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of datasets" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
