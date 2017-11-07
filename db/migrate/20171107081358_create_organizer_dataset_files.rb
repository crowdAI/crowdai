class CreateOrganizerDatasetFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :organizer, foreign_key: true
      t.string :task
      t.timestamps
    end

  end
end
