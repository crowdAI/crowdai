module LeaderboardVideosHelper

  def submission_media(submission_id)
    submission = Submission.find(submission_id)
    if submission.media_content_type.present?
      type = submission.media_content_type.split('/').first
      if type == 'image'
        return image_tag submission.media_thumbnail, size: '125x125'
      end
      if type == 'video'
        return video_tag submission.media_thumbnail, size: "125x125"
      end
    else
      return submission_video(submission_id)
    end
  end

  def large_submission_media(submission_id)
    submission = Submission.find(submission_id)
    if submission.media_content_type.present?
      type = submission.media_content_type.split('/').first
      if type == 'image'
        return image_tag submission.media_thumbnail
      end
      if type == 'video'
        return video_tag submission.media_thumbnail
      end
    else
      return large_submission_video(submission_id)
    end
  end

  def submission_video_url(submission_id)
    video_url = nil
    submission_file = SubmissionFile.where(submission_id: submission_id, leaderboard_video: true).where.not(submission_file_s3_key: nil).order("created_at desc").first

    if submission_file.present?
      video_url = s3_expiring_url(submission_file.submission_file_s3_key)
    end
    return video_url
  end

  def submission_video(submission_id)
    url = submission_video_url(submission_id)
    if url.present?
      return video_tag(url, size: "125x125")
    else
      return image_tag (image_path 'image_not_found.png'), size: '125x125'
    end
  end

  def large_submission_video(submission_id)
    url = submission_video_url(submission_id)
    if url.present?
      return video_tag(url)
    else
      return image_tag (image_path 'image_not_found.png')
    end
  end

end
