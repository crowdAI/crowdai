FactoryBot.define do
  factory :submission_grade, class: SubmissionGrade do
    submission
    grading_status_cd 'graded'
    score 0.2345
    score_secondary 0.99
    grading_message '** My first submission!'
  end
end
