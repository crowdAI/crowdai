class Submission < ActiveRecord::Base
  before_validation :cache_rendered_markdown
  before_save :set_post_challenge

  belongs_to :challenge
  belongs_to :participant
  has_many :submission_files, dependent: :destroy
  has_many :submission_grades, dependent: :destroy
  accepts_nested_attributes_for :submission_files, reject_if: :all_blank, allow_destroy: true
  has_many :votes, as: :votable

  as_enum :grading_status, [:ready, :submitted, :graded, :failed], map: :string
  validates_presence_of :grading_status

  validates_presence_of :docker_configuration_id
  validates_presence_of :description_markdown


  APIS = {
    'google' => "Google Vision",
    'microsoft' => 'Microsoft Computer Vision',
    'clarifai' => 'Clarifai',
    'watson' => 'Watson',
    'none' => 'No external API used'
  }


  def ready?
    self.grading_status == :ready
  end

  def submitted?
    self.grading_status == :submitted
  end

  def graded?
    self.grading_status == :graded
  end

  def failed?
    self.grading_status == :failed
  end



  private
  def cache_rendered_markdown
    if description_markdown_changed?
      self.description = RenderMarkdown.new.render(description_markdown)
    end
  end

  # set flag if challenge has completed
  def set_post_challenge
    if self.challenge.events.any?
      challenge_end = self.challenge.events.last.event_time
      if Time.now > challenge_end
        self.post_challenge = true
      end
    end
  end


end
