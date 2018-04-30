class AddSeqToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :seq, :integer
  end
end
