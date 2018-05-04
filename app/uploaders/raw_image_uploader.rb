class RawImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "raw_images/#{model.class.to_s.pluralize.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png svg)
  end

end
