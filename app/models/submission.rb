class Submission < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :participant
  belongs_to :team
  has_many :submission_files, dependent: :destroy
  accepts_nested_attributes_for :submission_files, reject_if: :all_blank, allow_destroy: true

  as_enum :submission_type, [:participant, :team], map: :string
  validates_presence_of :submission_type

  as_enum :grading_status, [:ready, :submitted, :graded, :failed], map: :string
  validates_presence_of :grading_status


  FRAMEWORKS = {
    'caffe' => "Caffe",
    'tensorflow' => 'Tensorflow',
    'torch7' => 'Torch7',
    'scikit2' => 'Python-2 Scikit-Learn',
    'scikit3' => 'Python-3 Scikit-Learn',
    'octave' => 'Octave',
    'keras' => 'Keras'
  }

end
