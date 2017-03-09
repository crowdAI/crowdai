class Mailer < ApplicationRecord
  has_many :emails
  default_scope { order('mailer') }


  def paused?
    self.paused
  end

  def running?
    !self.paused
  end

end
