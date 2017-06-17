class Convert

  def call
    dataset_files = DatasetFile.where(dataset_file: nil).where.not(dataset_file_s3_key: nil)
    dataset_files.each_with_index do |dataset_file,idx|
      key = dataset_file.dataset_file_s3_key
      puts "processing #{idx}: #{key}\n"
      filename = key.split('/')[-1]
      Aws::S3::Client.new.get_object(bucket: ENV['AWS_S3_BUCKET'], key: key, response_target: "tmp/#{filename}")
      dataset_file.dataset_file = Rails.root.join("tmp/#{filename}").open
      dataset_file.save!
    end
  end

end
