class DatasetFileUploader < CarrierWave::Uploader::Base
  storage :fog

  def store_dir
    "dataset_files/#{model.class.to_s.pluralize.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(zip tar pdf csv txt)
  end
end
