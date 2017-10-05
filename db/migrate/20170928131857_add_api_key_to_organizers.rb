class AddApiKeyToOrganizers < ActiveRecord::Migration[5.1]
  def change
    add_column :organizers, :api_key, :string
    remove_column :challenges, :api_key, :string
  end
end
