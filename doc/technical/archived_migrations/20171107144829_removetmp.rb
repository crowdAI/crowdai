class Removetmp < ActiveRecord::Migration[5.1]
  def change
    remove_column :challenges, :tmp, :string

  end
end
