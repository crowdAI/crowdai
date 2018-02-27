class AddMentionsCacheToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :mentions_cache, :string
  end
end
