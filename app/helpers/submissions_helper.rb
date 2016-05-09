module SubmissionsHelper

  def score(submission)
    if submission.grading_status == 'graded'
      return submission.score
    else
      return "Pending"
    end
  end

end
