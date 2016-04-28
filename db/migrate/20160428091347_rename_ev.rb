class RenameEv < ActiveRecord::Migration
  def change
    rename_column :challenges, :evaluation, :evaluation_markdown
  end
end
