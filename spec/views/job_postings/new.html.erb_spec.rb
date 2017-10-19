require 'rails_helper'

RSpec.describe "job_postings/new", type: :view do
  before(:each) do
    assign(:job_posting, JobPosting.new(
      :title => "MyString",
      :organisation => "MyString",
      :contact_name => "MyString",
      :contact_email => "MyString",
      :contact_phone => "MyString",
      :status_cd => "MyString",
      :description_markdown => "MyText",
      :description => "MyText",
      :remote => false,
      :location => "MyString",
      :country => "MyString",
      :page_views => 1
    ))
  end

  it "renders new job_posting form" do
    render

    assert_select "form[action=?][method=?]", job_postings_path, "post" do

      assert_select "input[name=?]", "job_posting[title]"

      assert_select "input[name=?]", "job_posting[organisation]"

      assert_select "input[name=?]", "job_posting[contact_name]"

      assert_select "input[name=?]", "job_posting[contact_email]"

      assert_select "input[name=?]", "job_posting[contact_phone]"

      assert_select "input[name=?]", "job_posting[status_cd]"

      assert_select "textarea[name=?]", "job_posting[description_markdown]"

      assert_select "textarea[name=?]", "job_posting[description]"

      assert_select "input[name=?]", "job_posting[remote]"

      assert_select "input[name=?]", "job_posting[location]"

      assert_select "input[name=?]", "job_posting[country]"

      assert_select "input[name=?]", "job_posting[page_views]"
    end
  end
end
