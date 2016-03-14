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

  accepts_nested_attributes_for :timelines, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :submissions, reject_if: :all_blank, allow_destroy: true

  as_enum :status, [:draft, :running, :completed, :cancelled], map: :string
  validates_presence_of :competition
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :status
  validates_presence_of :hosting_institution
end

# == Schema Information
#
# Table name: competitions
#
#  id                     :integer          not null, primary key
#  hosting_institution_id :integer
#  competition            :string
#  start_date             :date
#  end_date               :date
#  status_cd              :string
#  description            :text
#  evaluation             :text
#  evaluation_criteria    :text
#  rules                  :text
#  prizes                 :text
#  resources              :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
