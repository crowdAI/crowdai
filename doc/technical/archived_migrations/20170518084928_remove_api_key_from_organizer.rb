class RemoveApiKeyFromOrganizer < ActiveRecord::Migration[5.0]
  def change
    remove_column :organizers, :api_key
  end
end
