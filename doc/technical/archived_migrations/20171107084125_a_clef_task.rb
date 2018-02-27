
class AClefTask < ActiveRecord::Migration[5.1]
  def change
    create_table :task_dataset_files do |t|
      t.references :clef_tasks, foreign_key: true
      t.integer :seq, default: 0
      t.string :description
      t.boolean :evaluation, default: false
      t.string :title

      t.timestamps
    end
  end
end
