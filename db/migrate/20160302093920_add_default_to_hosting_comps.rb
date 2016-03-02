class AddDefaultToHostingComps < ActiveRecord::Migration
  def change
    change_column_default :competitions, :status_cd, 'draft'
    
  end
end
