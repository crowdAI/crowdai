module S3FilesHelper

  def s3_filesize(s3_key)
    return 0 if s3_key.nil?
    s3_file_obj = Aws::S3::Object.new(bucket_name: ENV['AWS_S3_BUCKET'], key: s3_key)
    return 0 if !s3_file_obj.exists?
    filesize = number_to_human_size(s3_file_obj.content_length)
  end


  def s3_expiring_url(s3_key)
    s3_file_obj = Aws::S3::Object.new(bucket_name: ENV['AWS_S3_BUCKET'], key: s3_key)
    if s3_file_obj && s3_file_obj.key && !s3_file_obj.key.blank?
      return s3_file_obj.presigned_url(:get, expires_in: 7.days.to_i)
    else
      return nil
    end
  end


  def s3_filename(s3_key)
    return nil if s3_key.nil?
    s3_key.split('/')[-1]
  end


  def datasets_url(s3_key)
    logger.debug("s3_key: #{s3_key}")
    #s3 = Aws::S3::Client.new
    #resp = s3.get_object(bucket: ENV['AWS_S3_BUCKET'], key: s3_key)
    #file_size = resp.content_length
    #expiring_url = resp.presigned_url(:get, expires_in: 3600)
    #out = capture { link_to s3_file_info(s3_file_obj), expiring_url }
    s3 = Aws::S3::Object.new(bucket_name: ENV['AWS_S3_BUCKET'], key: s3_key)
  end


  def s3_file_info(s3_file_obj)
    "#{number_to_human_size(1024 * s3_file_obj.content_length)}"
  end

  def download_url(file)
    challenge = Challenge.find(file.challenge_id)

    if current_participant.admin? || current_participant.organizer_id == challenge.organizer_id
      out = capture { link_to file_info(file), file.dataset_file.url }
      out << capture { link_to content_tag(:i, nil, class: 'fa fa-trash-o pull-right'),
                       [challenge,file],
                       method: :delete,
                       data: { confirm: 'Are you sure?' } }
    else
      out = capture { link_to file_info(file), file.dataset_file.expiring_url }
    end
    out
  end

end
