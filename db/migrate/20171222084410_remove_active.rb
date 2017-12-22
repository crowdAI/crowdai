class RemoveActive < ActiveRecord::Migration[5.1]
  def change
    remove_column :challenge_calls, :active
  end
end
