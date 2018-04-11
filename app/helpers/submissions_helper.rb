module SubmissionsHelper

  def score(submission)
    challenge = submission.challenge
    if submission.graded?
      if challenge.secondary_sort_order == 'not_used'
        return "<li>Mean F1: #{submission.score}</li>".html_safe
      else
        return "<li>Mean F1: #{submission.score}</li><li>Mean Log Loss: #{submission.score_secondary}</li>".html_safe
      end
    else
      if submission.grading_message
        return "<li>Status: #{submission.grading_status}</li><li>#{submission.grading_message}</li>".html_safe
      else
        return "<li>Status: #{submission.grading_status}</li>".html_safe
      end
    end
  end

end
