# == Schema Information
#
# Table name: mailers
#
#  id               :integer          not null, primary key
#  mailer_classname :string
#  paused           :boolean          default(FALSE)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Mailer < ApplicationRecord
  has_many :emails
  default_scope { order('mailer_classname') }


  def paused?
    self.paused
  end

  def running?
    !self.paused
  end

end
