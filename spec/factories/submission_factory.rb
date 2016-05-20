FactoryGirl.define do
  factory :submission, class: Submission do
    association :challenge
    association :participant
    grading_status_cd 'ready'
    description_markdown '#Upload description'
    framework 'scikit3'
    score 1.5
  end
end
