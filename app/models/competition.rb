class Competition < ActiveRecord::Base
  belongs_to :hosting_institution
  has_one :dataset
  accepts_nested_attributes_for :dataset, reject_if: :all_blank, allow_destroy: true
  has_many :dataset_files, dependent: :destroy
  accepts_nested_attributes_for :dataset_files, reject_if: :all_blank, allow_destroy: true


  has_many :timelines, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_many :user_competitions
  has_many :users, :through => :user_competitions
  has_many :leaderboards
  has_many :topics

  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true

  accepts_nested_attributes_for :timelines, reject_if: :all_blank, allow_destroy: true
  #accepts_nested_attributes_for :submissions, reject_if: :all_blank, allow_destroy: true TODO cleanup controller

  as_enum :status, [:draft, :running, :completed, :cancelled], map: :string
  validates_presence_of :competition
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :status
  validates_presence_of :hosting_institution
end
