class AddDescriptionToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :description, :text
  end
end
