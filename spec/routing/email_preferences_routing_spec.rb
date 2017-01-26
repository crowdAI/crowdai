require "rails_helper"

RSpec.describe EmailPreferencesController, type: :routing do
  describe "routing" do

    it "does not route to #index" do
      #expect(:get => "/participants/sean/email_preferences").not_to be_routable
    end

    it "does not route to #new" do
    #  expect(:get => "/participants/sean/email_preferences/new").not_to be_routable
    end

    it "does not route to #show" do
    #  expect(:get => "/participants/sean/email_preferences/1").not_to be_routable
    end

    it "routes to #edit" do
      expect(:get => "/participants/sean/email_preferences/1/edit").to route_to("email_preferences#edit", participant_id: 'sean', :id => "1")
    end

    it "does not route to #create" do
    #  expect(:post => "/participants/sean/email_preferences").not_to be_routable
    end

    it "routes to #update via PUT" do
      expect(:put => "/participants/sean/email_preferences/1").to route_to("email_preferences#update", participant_id: 'sean', :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/participants/sean/email_preferences/1").to route_to("email_preferences#update", participant_id: 'sean', :id => "1")
    end

    it "does not route to #destroy" do
    #  expect(:delete => "/participants/sean/email_preferences/1").not_to be_routable
    end

  end
end
