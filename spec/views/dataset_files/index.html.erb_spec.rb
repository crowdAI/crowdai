=begin
require "rails_helper"

describe "dataset_files/index.html.erb" do
  let(:challenge) { create :challenge, :running }

  context "when the current_participant is a participant" do
    let(:participant) { create :participant }
    before do
      sign_in participant
      assign(:challenge, challenge)
      assign(:dataset_files, challenge.dataset_files)
      render template: "dataset_files/index.html.erb"
    end
    it "dosn't show the add file button" do
      expect(rendered).not_to have_link("Add File")
    end
    it "doesn't show the delete button" do
      expect(rendered).not_to have_link("delete")
    end
  end

  context "when the current_participant is an admin" do
    let(:participant) { create :participant, :admin }
    before do
      sign_in participant
      assign(:challenge, challenge)
      assign(:dataset_files, challenge.dataset_files)
      render template: "dataset_files/index.html.erb"
    end
    it "shows the add file button" do
      #expect(rendered).to have_text("ADD FILE")
      puts rendered
    end
    it "shows the delete button" do
      expect(rendered).to have_link("delete")
    end
  end
end
=end
