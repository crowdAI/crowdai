class AddClefOrganizerToOrganizers < ActiveRecord::Migration[5.1]
  def change
    add_column :organizers, :clef_organizer, :boolean, default: true
  end
end
