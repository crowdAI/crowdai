class AddMediaContentTypeToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :media_content_type, :string
  end
end
