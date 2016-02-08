class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.references :competition, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
