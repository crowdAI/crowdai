class Slugga < ActiveRecord::Migration[5.0]
  def change
    remove_column :votes, :slug
  end
end
