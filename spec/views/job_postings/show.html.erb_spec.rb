require 'rails_helper'

RSpec.describe "job_postings/show", type: :view do
  before(:each) do
    @job_posting = assign(:job_posting, JobPosting.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Organisation/)
    expect(rendered).to match(/Contact Name/)
    expect(rendered).to match(/Contact Email/)
    expect(rendered).to match(/Contact Phone/)
    expect(rendered).to match(/Status Cd/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/2/)
  end
end
