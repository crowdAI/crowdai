class ConvertPosts < ActiveRecord::Migration
  def change
    posts = Post.all
    posts.each do |p|
      p.post_markdown = p.post
      p.save
    end
  end
end
