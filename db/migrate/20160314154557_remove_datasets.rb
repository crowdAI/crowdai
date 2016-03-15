class RemoveDatasets < ActiveRecord::Migration
  def change
    drop_table 'datasets' if ActiveRecord::Base.connection.table_exists? 'datasets'
    drop_table 'file_attachements' if ActiveRecord::Base.connection.table_exists? 'file_attachements'
  end    
end
