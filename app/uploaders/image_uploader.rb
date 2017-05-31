class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  # https://github.com/DarthSim/carrierwave-bombshelter

  storage :fog

  process resize_to_fill: [600, 600]

  def store_dir
    "images/#{model.class.to_s.pluralize.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
