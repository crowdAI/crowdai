module Markdownable
  extend ActiveSupport::Concern
  include ActiveModel::Dirty

  included do
    before_save :cache_rendered_markdown
  end

  def cache_rendered_markdown
    self.changed_attribute_names_to_save.select{|c| c.end_with?("markdown") }.each do |col_markdown|
      col = col_markdown.remove("_markdown")
      self.send("#{col}=", Kramdown::Document.new(
        self.send(col_markdown),{coderay_line_numbers: nil}).to_html)
    end
  end

end
