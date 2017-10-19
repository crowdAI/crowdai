class JobPosting < ApplicationRecord
  before_save :cache_rendered_markdown

  def record_page_view
    self.page_views ||= 0
    self.page_views += 1
    self.save
  end

  as_enum :status, [:draft, :open, :closed], map: :string

  def cache_rendered_markdown
    if description_markdown_changed?
      self.description = Kramdown::Document.new(self.description_markdown,{coderay_line_numbers: nil}).to_html
    end
  end

end
