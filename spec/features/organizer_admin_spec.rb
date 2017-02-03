require "rails_helper"

feature 'Organizer CRUD for admin user', js: true do
  let!(:admin) { create(:participant, :admin) }
  let!(:running_challenge) { create(:challenge) }

  describe "create new organizer link" do
    before(:example) do
      visit_landing_page(admin)
    end
    specify { expect(page).to have_link 'Organizers' }
  end

  describe "organizers index page" do
    before(:example) do
      visit_organizers_index(admin)
    end
    specify { expect(page).to have_link 'Add Organizer' }
    specify { expect(page).to have_link running_challenge.organizer.organizer }
  end

  describe "organizer creation page" do
    before(:example) do
      visit_organizers_index(admin)
      click_link 'Add Organizer'
    end
    specify { expect(page).to have_field 'Organizer' }
    specify { expect(page).to have_field 'Address' }
    specify { expect(page).to have_field 'Description' }
  end

  describe "create organizer" do
    before(:example) do
      visit_organizers_index(admin)
      click_link 'Add Organizer'
      fill_in "Organizer",                  with: 'Doodlebugs Inc.'
      fill_in "Address",                    with: 'Address information'
      fill_in "Description",                with: 'Doodlebugs Inc. track and aggegrate Doodlebug data across the globe'
      click_button 'Create Organizer'
    end
    specify { expect(page).to have_content "Organizer has been created." }
    specify { expect(page).to have_content 'Doodlebugs Inc. track and aggegrate Doodlebug data across the globe' }
    specify { expect(page).to have_link '+ New Challenge' }
    specify { expect(page).to have_link 'Edit Organizer' }
    specify { expect(page).to have_link 'Delete Organizer' }
    specify { expect(page).to have_link 'Organizers' }
  end


end
