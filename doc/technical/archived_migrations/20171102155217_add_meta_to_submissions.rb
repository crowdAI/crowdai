class AddMetaToSubmissions < ActiveRecord::Migration[5.1]
  def change
    add_column :submissions, :meta, :json, default: {}, null: true
  end
end
