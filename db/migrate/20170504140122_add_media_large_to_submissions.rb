class AddMediaLargeToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :media_large, :string
  end
end
