require 'rails_helper'

RSpec.describe "inherited_resources/bases/new", type: :view do
  before(:each) do
    assign(:inherited_resources_base, InheritedResources::Base.new())
  end

  it "renders new inherited_resources_base form" do
    render

    assert_select "form[action=?][method=?]", inherited_resources_bases_path, "post" do
    end
  end
end
