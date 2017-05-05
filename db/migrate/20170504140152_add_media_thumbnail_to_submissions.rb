class AddMediaThumbnailToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :media_thumbnail, :string
  end
end
