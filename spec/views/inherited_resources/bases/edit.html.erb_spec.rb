require 'rails_helper'

RSpec.describe "inherited_resources/bases/edit", type: :view do
  before(:each) do
    @inherited_resources_base = assign(:inherited_resources_base, InheritedResources::Base.create!())
  end

  it "renders the edit inherited_resources_base form" do
    render

    assert_select "form[action=?][method=?]", inherited_resources_base_path(@inherited_resources_base), "post" do
    end
  end
end
