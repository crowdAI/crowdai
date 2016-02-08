require 'rails_helper'

RSpec.describe "submissions/show", type: :view do
  before(:each) do
    @submission = assign(:submission, Submission.create!(
      :competition => nil,
      :user => nil,
      :team => nil,
      :evaluated => false,
      :score => 1.5,
      :ranking => 1.5,
      :submission_type_cd => "Submission Type Cd",
      :withdrawn => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Submission Type Cd/)
    expect(rendered).to match(/false/)
  end
end
