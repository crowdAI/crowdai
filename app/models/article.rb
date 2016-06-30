class Article < ActiveRecord::Base
  belongs_to :participant
  has_many :votes, as: :votable
  has_many :article_sections, dependent: :destroy
  accepts_nested_attributes_for :article_sections, reject_if: :all_blank, allow_destroy: true
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true

  validates_presence_of :category
  validates_presence_of :summary
  validates_length_of :summary, maximum: 20, allow_blank: false


  CATEGORIES = {
    'caffe' => "Caffe",
    'tensorflow' => 'Tensorflow',
    'torch7' => 'Torch7',
    'scikit2' => 'Python-2 Scikit-Learn',
    'scikit3' => 'Python-3 Scikit-Learn',
    'octave' => 'Octave',
    'keras' => 'Keras',
    'machine_learning' => 'Machine Learning',
    'data_mining' => 'Data Mining',
    'deep_learning' => 'Deep Learning'
  }



end
