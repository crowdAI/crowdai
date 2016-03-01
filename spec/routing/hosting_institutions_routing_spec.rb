# == Schema Information
#
# Table name: hosting_institutions
#
#  id             :integer          not null, primary key
#  institution    :string
#  address        :text
#  description    :text
#  contact_person :string
#  contact_phone  :string
#  contact_email  :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require "rails_helper"

RSpec.describe HostingInstitutionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/hosting_institutions").to route_to("hosting_institutions#index")
    end

    it "routes to #new" do
      expect(:get => "/hosting_institutions/new").to route_to("hosting_institutions#new")
    end

    it "routes to #show" do
      expect(:get => "/hosting_institutions/1").to route_to("hosting_institutions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hosting_institutions/1/edit").to route_to("hosting_institutions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/hosting_institutions").to route_to("hosting_institutions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/hosting_institutions/1").to route_to("hosting_institutions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/hosting_institutions/1").to route_to("hosting_institutions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hosting_institutions/1").to route_to("hosting_institutions#destroy", :id => "1")
    end

  end
end
