require 'rails_helper'

RSpec.describe "datasets/new", type: :view do
  before(:each) do
    assign(:dataset, Dataset.new(
      :competition => nil,
      :description => "MyText"
    ))
  end

  it "renders new dataset form" do
    render

    assert_select "form[action=?][method=?]", datasets_path, "post" do

      assert_select "input#dataset_competition_id[name=?]", "dataset[competition_id]"

      assert_select "textarea#dataset_description[name=?]", "dataset[description]"
    end
  end
end
