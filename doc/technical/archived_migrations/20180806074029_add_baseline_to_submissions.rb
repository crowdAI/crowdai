class AddBaselineToSubmissions < ActiveRecord::Migration[5.2]
  def change
    add_column :submissions, :baseline, :boolean
    add_column :submissions, :baseline_comment, :string
  
  end
end
