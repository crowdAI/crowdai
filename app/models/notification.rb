class Notification < ApplicationRecord
  belongs_to :participant
  belongs_to :notifiable, polymorphic: true

  scope :recent, -> { order(created_at: :desc) }
  scope :unread, -> { where(read_at: nil) }

  def read?
    self.read_at.present?
  end

end
