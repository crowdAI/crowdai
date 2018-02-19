class Submission < ApplicationRecord
  before_validation :cache_rendered_markdown
  before_validation :generate_short_url

  belongs_to :challenge
  belongs_to :participant, optional: true
  has_many :submission_files, dependent: :destroy
  has_many :submission_grades, dependent: :destroy
  has_many :submission_comments, dependent: :destroy
  accepts_nested_attributes_for :submission_files, reject_if: lambda { |f| f[:submission_file_s3_key].blank? }, allow_destroy: true
  has_many :votes, as: :votable

  as_enum :grading_status, [:ready, :submitted, :graded, :failed], map: :string

  validates :participant_id,            presence: true
  validates :challenge_id,              presence: true
  validates :grading_status,            presence: true

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
    if self.description_markdown && description_markdown_changed?
      self.description = Kramdown::Document.new(self.description_markdown,{coderay_line_numbers: nil}).to_html
    end
  end

  def generate_short_url
    if self.short_url.blank?
      short_url = nil
      begin
        short_url = SecureRandom.hex(6)
      end while (Submission.exists?(short_url: short_url))
      self.short_url = short_url
    end
  end

end
