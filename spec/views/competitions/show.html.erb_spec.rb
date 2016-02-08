require 'rails_helper'

RSpec.describe "competitions/show", type: :view do
  before(:each) do
    @competition = assign(:competition, Competition.create!(
      :hosting_institution => nil,
      :competition => "",
      :status_cd => "Status Cd",
      :description => "MyText",
      :evaluation => "MyText",
      :evaluation_criteria => "MyText",
      :rules => "MyText",
      :prizes => "MyText",
      :resources => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Status Cd/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
