class AddStatus < ActiveRecord::Migration[5.0]
  def change
    add_column :emails, :status_cd, :string
    execute "update emails set status_cd = state;"
    remove_column :emails, :state
  end
end
