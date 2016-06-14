module SubmissionsHelper

  def score(submission)
    if submission.graded?
      challenge = submission.challenge
      if challenge.secondary_sort_order == 'not_used'
        return "<li>Mean F1: #{submission.score}</li>".html_safe
      else
        return "<li>Mean F1: #{submission.score}</li><li>Mean Log Loss: #{submission.score_secondary}</li>".html_safe
      end
    else
      if challenge.grading_message
        return "<li>Status: #{submission.status}</li><li>#{submission.grading_message}</li>"
      else
        return "<li>Status: #{submission.status}</li>"
      end
    end
  end

end
