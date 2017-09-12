class AddDatasetDescriptionToCompetition < ActiveRecord::Migration
  def change
    add_column :competitions, :dataset_description, :text
  end
end
