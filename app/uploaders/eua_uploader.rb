class EuaUploader < CarrierWave::Uploader::Base

  storage :fog

  def store_dir
    "EUAs/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(pdf)
  end

end
