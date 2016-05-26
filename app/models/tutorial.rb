class Tutorial < ActiveRecord::Base
  belongs_to :participant
  has_many :votes, as: :votable
end
