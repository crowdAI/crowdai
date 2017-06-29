class Dataset::Cell::ListDetail < Template::Cell
  inherit_views Dataset::Cell

  def show
    render :list_detail
  end

  def dataset_file
    model
  end

  def challenge
    @challenge ||= dataset_file.challenge
  end

  def expiring_url
    if s3_file_obj
      return s3_file_obj.presigned_url(:get, expires_in: 7.days.to_i)
    else
      return '#'
    end
  end

  def file_title
    if dataset_file.title.present?
      dataset_file.title
    else
      dataset_file.description
    end
  end

  def file_description
    if dataset_file.title.present?
      dataset_file.description
    else
      nil
    end
  end

  def file_size
    return 0 if s3_file_obj.nil? || !s3_file_obj.exists?
    number_to_human_size(s3_file_obj.content_length)
  end

  def file_name
    s3_key = dataset_file.dataset_file_s3_key
    return nil if s3_key.nil?
    s3_key.split('/')[-1]
  end

  def file_type
    s3_key = dataset_file.dataset_file_s3_key
    return nil if s3_key.nil?
    ext = s3_key.split('/')[-1].split('.')[-1]
    ext && ext.upcase
  end

  def s3_file_obj
    s3_key = dataset_file.dataset_file_s3_key
    return nil if s3_key.nil?
    s3_file_obj = Aws::S3::Object.new(bucket_name: ENV['AWS_S3_BUCKET'], key: s3_key)
    if s3_file_obj && s3_file_obj.key && !s3_file_obj.key.blank?
      return s3_file_obj
    else
      return nil
    end
  end

end
