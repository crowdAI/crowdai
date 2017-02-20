module LeaderboardVideosHelper

  def submission_video_url(submission_id)
    video_url = nil
    submission_file = SubmissionFile.where(submission_id: submission_id, leaderboard_video: true).where.not(submission_file_s3_key: nil).first

    if submission_file.present?
      video_url = s3_expiring_url(submission_file.submission_file_s3_key)
    end
  end


  def submission_video(submission_id)
    url = submission_video_url(submission_id)
    if url.present?
      video_tag(url, size: "100x100", autoplay: true, loop: true)
    else
      "<span id='no-video'></span>".html_safe
    end
  end

end
