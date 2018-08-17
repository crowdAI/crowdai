class DefaultBaseline < ActiveRecord::Migration[5.2]
  def change
    change_column :submissions, :baseline, :boolean, default: false
    execute "update submissions set baseline = false;"
  end
end
