class TouchComments < ActiveRecord::Migration[5.1]
  def change
    Comment.all.each do |comment|
      comment.comment = Kramdown::Document.new(
        comment.comment_markdown,
        {coderay_line_numbers: nil}).to_html
      comment.save
    end
  end
end
