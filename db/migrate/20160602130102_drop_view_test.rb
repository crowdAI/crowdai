class DropViewTest < ActiveRecord::Migration
  def change
    execute "drop view test;"
  end
end
