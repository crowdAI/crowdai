class AddPostedAtToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :posted_at, :timestamp
    execute("update blogs set posted_at = created_at;")
  end
end
