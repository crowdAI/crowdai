class Convert

  def call
    DatasetFile.all.each do |dataset_file|
      dataset_file = DatasetFile.find(dataset_file_id)
      key = dataset_file.dataset_file_s3_key
      filename = key.split('/')[-1]
      Aws::S3::Client.new.get_object(bucket: ENV['AWS_S3_BUCKET'], key: key, response_target: "tmp/#{filename}")
      dataset_file.dataset_file = Rails.root.join("tmp/#{filename}").open
      dataset_file.save!
    end
  end

end
