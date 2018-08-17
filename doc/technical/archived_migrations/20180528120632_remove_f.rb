class RemoveF < ActiveRecord::Migration[5.2]
  def change
    remove_columns :challenges, :ranking_window
    remove_columns :challenges, :ranking_highlight
  end
end
