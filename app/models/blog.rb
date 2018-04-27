class Blog < ApplicationRecord
  belongs_to :participant
  has_many :votes, as: :votable
end
