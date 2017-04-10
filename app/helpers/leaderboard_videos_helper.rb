module LeaderboardVideosHelper

  def submission_video_url(submission_id)
    video_url = nil
    submission_file = SubmissionFile.where(submission_id: submission_id, leaderboard_video: true).where.not(submission_file_s3_key: nil).order("created_at desc").first

    if submission_file.present?
      video_url = s3_expiring_url(submission_file.submission_file_s3_key)
    end
  end


  def submission_video(submission_id)
    url = submission_video_url(submission_id)
    if url.present?
      video_tag(url, size: "125x125", autoplay: true, loop: true)
    else
      image_tag (image_path 'image_not_found.png'), size: '125x125'
    end
  end

  def large_submission_video(submission_id)
    url = submission_video_url(submission_id)
    if url.present?
      video_tag(url, autoplay: true, loop: true)
    else
      image_tag (image_path 'image_not_found.png')
    end
  end

end
