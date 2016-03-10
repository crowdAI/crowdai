module SubmissionsHelper

  def score(submission)
    if submission.withdrawn == true
      return "Withdrawn #{submission.withdrawn_date}"
    end
    if submission.evaluated == true
      return submission.score
    else
      return "Pending evaluation"
    end
  end

end
