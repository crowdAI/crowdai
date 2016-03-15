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


  def running?
    return true if status_cd == 'running'
    return false
  end

  def start_date
    self.timelines.first.event_time
  end

  def end_date
    self.timelines.last.event_time
  end

  def remaining_text
    time_remaining[0]
  end

  def pct_passed
    time_remaining[1]
  end

  def pct_left
    time_remaining[2]
  end

  def time_remaining
    if self.running?
      first_milestone = self.timelines.first
      last_milestone = self.timelines.last
      competition_duration = self.end_date - self.start_date
      days_left = self.end_date - Time.now

      pct_left = ((days_left / competition_duration) * 100).floor
      pct_passed = 100 - pct_left
      if days_left < 1
        remaining_text =  "#{((days_left)/1.day * 24).floor} hours remaining"
      else
        remaining_text = "#{((days_left)/1.day).floor} days remaining"
      end
      return remaining_text, pct_passed, pct_left
    else
      return 'completed', 100, 0
    end
  end

end
