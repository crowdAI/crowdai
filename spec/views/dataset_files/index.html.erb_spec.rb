require 'rails_helper'

RSpec.describe "dataset_files/index", type: :view do
  before(:each) do
    assign(:dataset_files, [
      DatasetFile.create!(
        :dataset => nil,
        :seq => 1,
        :filename => "Filename",
        :filetype => "Filetype"
      ),
      DatasetFile.create!(
        :dataset => nil,
        :seq => 1,
        :filename => "Filename",
        :filetype => "Filetype"
      )
    ])
  end

  it "renders a list of dataset_files" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Filename".to_s, :count => 2
    assert_select "tr>td", :text => "Filetype".to_s, :count => 2
  end
end
