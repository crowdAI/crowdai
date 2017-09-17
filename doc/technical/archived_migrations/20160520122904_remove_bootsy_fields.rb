class RemoveBootsyFields < ActiveRecord::Migration
  def change
    remove_column :challenges, :description_rendered
    remove_column :challenges, :rules_rendered
    remove_column :challenges, :prizes_rendered
    remove_column :challenges, :resources_rendered
    remove_column :challenges, :dataset_description_rendered
    remove_column :challenges, :submission_instructions_rendered
  end
end
