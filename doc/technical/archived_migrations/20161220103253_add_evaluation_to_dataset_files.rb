class AddEvaluationToDatasetFiles < ActiveRecord::Migration
  def change
    add_column :dataset_files, :evaluation, :boolean, default: false
    execute "update dataset_files set evaluation = false;"
  end

end
