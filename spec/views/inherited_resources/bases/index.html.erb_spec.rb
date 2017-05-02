require 'rails_helper'

RSpec.describe "inherited_resources/bases/index", type: :view do
  before(:each) do
    assign(:inherited_resources_bases, [
      InheritedResources::Base.create!(),
      InheritedResources::Base.create!()
    ])
  end

  it "renders a list of inherited_resources/bases" do
    render
  end
end
