require 'rails_helper'

RSpec.describe "job_postings/index", type: :view do
  before(:each) do
    assign(:job_postings, [
      JobPosting.create!(
        :title => "Title",
        :organisation => "Organisation",
        :contact_name => "Contact Name",
        :contact_email => "Contact Email",
        :contact_phone => "Contact Phone",
        :status_cd => "Status Cd",
        :description_markdown => "MyText",
        :description => "MyText",
        :remote => false,
        :location => "Location",
        :country => "Country",
        :page_views => 2
      ),
      JobPosting.create!(
        :title => "Title",
        :organisation => "Organisation",
        :contact_name => "Contact Name",
        :contact_email => "Contact Email",
        :contact_phone => "Contact Phone",
        :status_cd => "Status Cd",
        :description_markdown => "MyText",
        :description => "MyText",
        :remote => false,
        :location => "Location",
        :country => "Country",
        :page_views => 2
      )
    ])
  end

  it "renders a list of job_postings" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Organisation".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Name".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Email".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Status Cd".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
