class Blog < ApplicationRecord
  include Markdownable

  belongs_to :participant
  has_many :votes, as: :votable

  def record_page_view
    self.view_count ||= 0
    self.view_count += 1
    self.save
  end

end
