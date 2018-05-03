class AddClefFields < ActiveRecord::Migration[5.1]
  def change
    add_column :submissions, :clef_method_description, :text
    add_column :submissions, :clef_retrieval_type, :string
    add_column :submissions, :clef_run_type, :string
    add_column :submissions, :clef_primary_run, :boolean, default: false
    add_column :submissions, :clef_other_info, :text
    add_column :submissions, :clef_additional, :text
  end
end
