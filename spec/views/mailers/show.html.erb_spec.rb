require 'rails_helper'

RSpec.describe "mailers/show", type: :view do
  before(:each) do
    @mailer = assign(:mailer, Mailer.create!(
      :mailer => "Mailer",
      :paused => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Mailer/)
    expect(rendered).to match(/false/)
  end
end
