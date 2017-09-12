class FieldCleanup < ActiveRecord::Migration
  def change
    remove_column :submissions, :slug
    remove_column :submissions, :framework
    remove_column :challenges, :framework_required
  end
end
