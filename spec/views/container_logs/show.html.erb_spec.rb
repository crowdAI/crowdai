require 'rails_helper'

RSpec.describe "container_logs/show", type: :view do
  before(:each) do
    @container_log = assign(:container_log, ContainerLog.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
