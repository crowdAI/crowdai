class AddDescriptionToTopics < ActiveRecord::Migration[5.0]
  def change
    add_column :topics, :description, :string
    add_column :topics, :description_markdown, :string
    Topic.all.each do |topic|
      comment = topic.comments.first
      if comment
        topic.description = comment.comment
        topic.description_markdown = comment.comment_markdown
        topic.save!
        comment.destroy!
      end
    end
  end
end
