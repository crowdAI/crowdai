class DefaultSubmissions < ActiveRecord::Migration
  def change
    change_column_default :submissions, :evaluated, false
  end
end
