class AddImageFileToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :image_file, :string
    add_column :challenges, :image_file, :string
    add_column :organizers, :image_file, :string
    add_column :participants, :image_file, :string
  end
end
