class RemoveSett < ActiveRecord::Migration[5.1]
  def change
    remove_column :partners, :setting_id
  end
end
