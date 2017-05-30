class MoveVideos < ActiveRecord::Migration[5.0]
  def change
    execute "UPDATE submissions
                SET (media_large,media_thumbnail,media_content_type) =
                (SELECT submission_file_s3_key,
                        submission_file_s3_key,
                        'video/mp4'
                FROM submission_files s
                WHERE s.leaderboard_video = TRUE
                AND s.submission_id = submissions.id
                AND s.id = (SELECT MAX(x.id)
                              FROM submission_files x
                              WHERE x.submission_id = s.submission_id)
                );"
  end
end
