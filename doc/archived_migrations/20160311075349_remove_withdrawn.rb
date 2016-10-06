class RemoveWithdrawn < ActiveRecord::Migration
  def change
    remove_column :submissions, :withdrawn
    remove_column :submissions, :withdrawn_date
  end
end
