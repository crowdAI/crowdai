class Comment < ActiveRecord::Base
  include FriendlyId
  friendly_id :comment, use: :slugged
  belongs_to :commentable, :polymorphic => true
  belongs_to :participant
end
