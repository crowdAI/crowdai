require 'rails_helper'

feature "image clef field visibility" do
  let(:clef_task) { create(:task, :image_clef) }
  let(:challenge) { create :challenge, clef_task: clef_task }
  let(:organizer) { create :participant, :clef_organizer }
  let(:organizer_admin) { create :participant, organizer: organizer }
  let(:participant) { create :participant }
  let(:admin) { create :participant, :admin }
end
