require 'rails_helper'

RSpec.describe "inherited_resources/bases/show", type: :view do
  before(:each) do
    @inherited_resources_base = assign(:inherited_resources_base, InheritedResources::Base.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
