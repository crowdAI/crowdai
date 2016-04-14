class AddScoreSecondaryToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :score_secondary, :float
  end
end
