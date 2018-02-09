class Invitation < ApplicationRecord
  belongs_to :challenge
  belongs_to :participant, optional: true
end
