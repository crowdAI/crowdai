class AddScoreDisplayToSubmissions < ActiveRecord::Migration[5.1]
  def change
    add_column :submissions, :score_display, :float
    add_column :submissions, :score_secondary_display, :float
    add_column :challenge_rounds, :ranking_window, :integer
    add_column :challenge_rounds, :ranking_highlight, :integer
    add_column :challenge_rounds, :score_significant_digits, :integer
    add_column :challenge_rounds, :score_secondary_significant_digits, :integer 
  end
end
