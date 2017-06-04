class DropVersions < ActiveRecord::Migration[5.0]
  def change
    execute "drop table versions;"
  end
end
