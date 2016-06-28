class Article < ActiveRecord::Base
  belongs_to :participant
  has_many :votes, as: :votable
  has_many :article_sections, dependent: :destroy
  accepts_nested_attributes_for :article_sections, reject_if: :all_blank, allow_destroy: true
end
