class Mailer < ApplicationRecord
  has_many :emails

  def paused?
    self.paused
  end

  def running?
    !self.paused
  end

end
