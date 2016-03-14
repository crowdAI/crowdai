module SubmissionsHelper

  def score(submission)
    if submission.evaluated == true
      return submission.score
    else
      return "Pending"
    end
  end

end
