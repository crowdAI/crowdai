class AddNameToPartners < ActiveRecord::Migration[5.1]
  def change
    add_column :partners, :name, :string
  end
end
