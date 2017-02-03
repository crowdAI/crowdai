class DropEvents < ActiveRecord::Migration[5.0]
  def change
    execute 'drop table events';
  end
end
