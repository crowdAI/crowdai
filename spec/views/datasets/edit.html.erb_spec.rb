require 'rails_helper'

RSpec.describe "datasets/edit", type: :view do
  before(:each) do
    @dataset = assign(:dataset, Dataset.create!(
      :competition => nil,
      :description => "MyText"
    ))
  end

  it "renders the edit dataset form" do
    render

    assert_select "form[action=?][method=?]", dataset_path(@dataset), "post" do

      assert_select "input#dataset_competition_id[name=?]", "dataset[competition_id]"

      assert_select "textarea#dataset_description[name=?]", "dataset[description]"
    end
  end
end
