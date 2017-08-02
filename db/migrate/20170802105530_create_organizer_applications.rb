class CreateOrganizerApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :organizer_applications do |t|
      t.string :contact_name
      t.string :email
      t.string :phone
      t.string :organization
      t.string :organization_description
      t.string :challenge_description

      t.timestamps
    end
  end
end
