class DbCleanup < ActiveRecord::Migration
  def change
    drop_table :file_attachments
    drop_table :friendly_id_slugs
  end
end
