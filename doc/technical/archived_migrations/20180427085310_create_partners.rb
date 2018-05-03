class CreatePartners < ActiveRecord::Migration[5.1]
  def change
    create_table :partners do |t|
      t.references :setting, foreign_key: true
      t.references :organizer, foreign_key: true
      t.string :image_file
      t.boolean :visible, default: false
      t.integer :seq, default: 0

      t.timestamps
    end
  end
end
