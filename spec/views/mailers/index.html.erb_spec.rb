require 'rails_helper'

RSpec.describe "mailers/index", type: :view do
  before(:each) do
    assign(:mailers, [
      Mailer.create!(
        :mailer => "Mailer",
        :paused => false
      ),
      Mailer.create!(
        :mailer => "Mailer",
        :paused => false
      )
    ])
  end

  it "renders a list of mailers" do
    render
    assert_select "tr>td", :text => "Mailer".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
