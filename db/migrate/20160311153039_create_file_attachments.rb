class CreateFileAttachments < ActiveRecord::Migration
  def change
    create_table :file_attachments do |t|
      t.references :attachable, polymorphic: true, index: true
      t.string :description

      t.timestamps null: false
    end
  end
end
