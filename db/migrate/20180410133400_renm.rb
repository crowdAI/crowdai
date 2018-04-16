class Renm < ActiveRecord::Migration[5.1]
  def change
    rename_column :challenge_rounds, :score_significant_digits, :score_precision
    rename_column :challenge_rounds, :score_secondary_significant_digits, :score_secondary_precision
  end
end
