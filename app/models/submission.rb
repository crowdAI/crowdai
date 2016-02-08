class Submission < ActiveRecord::Base
  belongs_to :competition
  belongs_to :user
  belongs_to :team
end
