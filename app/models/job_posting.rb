class JobPosting < ApplicationRecord

  def record_page_view
    self.page_views ||= 0
    self.page_views += 1
    self.save
  end

  as_enum :status, [:draft, :open, :closed], map: :string
end
