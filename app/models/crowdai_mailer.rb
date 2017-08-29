class CrowdaiMailer < ApplicationRecord
  has_many :emails
  default_scope { order('mailer_classname') }

  def paused?
    self.paused
  end

  def running?
    !self.paused
  end

end
