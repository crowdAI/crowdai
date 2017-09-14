class MoveVideos < ActiveRecord::Migration[5.0]
  def change
    execute "update submissions set media_large
                = (select submission_file_s3_key
                FROM submission_files s
                WHERE s.leaderboard_video = TRUE
                AND s.submission_id = submissions.id
                AND s.id = (SELECT MAX(x.id)
                              FROM submission_files x
                              WHERE x.submission_id = s.submission_id));"

    execute "update submissions set media_thumbnail
              = (select submission_file_s3_key
                FROM submission_files s
                WHERE s.leaderboard_video = TRUE
                AND s.submission_id = submissions.id
                AND s.id = (SELECT MAX(x.id)
                      FROM submission_files x
                      WHERE x.submission_id = s.submission_id));"

    execute "update submissions set media_content_type
              = (select 'video/mp4'
                FROM submission_files s
                WHERE s.leaderboard_video = TRUE
                AND s.submission_id = submissions.id
                AND s.id = (SELECT MAX(x.id)
                      FROM submission_files x
                      WHERE x.submission_id = s.submission_id));"


  end
end
