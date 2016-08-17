class AddApiToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :api, :string
  end
end
