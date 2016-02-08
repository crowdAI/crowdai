require 'rails_helper'

RSpec.describe "dataset_files/show", type: :view do
  before(:each) do
    @dataset_file = assign(:dataset_file, DatasetFile.create!(
      :dataset => nil,
      :seq => 1,
      :filename => "Filename",
      :filetype => "Filetype"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Filename/)
    expect(rendered).to match(/Filetype/)
  end
end
