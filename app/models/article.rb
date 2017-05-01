class Article < ApplicationRecord
  include FriendlyId

  default_scope { order('updated_at DESC') }

  belongs_to :participant
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true
  has_many :votes, as: :votable
  has_paper_trail :ignore => [:view_count, :comment_count]
  has_many :comments, as: :commentable
  has_many :article_sections, dependent: :destroy
  accepts_nested_attributes_for :article_sections, reject_if: :all_blank, allow_destroy: true

  friendly_id :article, use: [:slugged, :finders]

  scope :published, -> () { where published: true }

  validates :participant_id,    presence: true
  validates :article,           presence: true
  validates :category,          presence: true
  validates :summary,           presence: true
  validates :view_count,        presence: true
  validates :vote_count,        presence: true


  CATEGORIES = {
    'caffe' => "Caffe",
    'tensorflow' => 'Tensorflow',
    'torch7' => 'Torch7',
    'scikit2' => 'Python-2 Scikit-Learn',
    'scikit3' => 'Python-3 Scikit-Learn',
    'octave' => 'Octave',
    'keras' => 'Keras',
    'machine_learning' => 'Machine learning',
    'data_mining' => 'Data mining',
    'deep_learning' => 'Deep learning'
  }


  def image_medium_url
    if image.present?
      image.image.url(:medium)
    else
      "//#{ENV['HOST']}/assets/image_not_found.png"
    end
  end

  def record_page_view
    self.view_count ||= 0
    self.view_count += 1
    self.save
  end

  def should_generate_new_friendly_id?
    article_changed?
  end


end
