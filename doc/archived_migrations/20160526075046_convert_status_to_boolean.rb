class ConvertStatusToBoolean < ActiveRecord::Migration
  def change
    remove_column :tutorials, :status_cd
    add_column :tutorials, :public_tutorial, :boolean, default: false
  end
end
