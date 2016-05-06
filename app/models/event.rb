class Event < ActiveRecord::Base
  belongs_to :challenge

  validates :seq, presence: true
  validates :event, presence: true
  validates :event_time, presence: true

  default_scope { order('seq') }

end
