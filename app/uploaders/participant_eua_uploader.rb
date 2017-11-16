class ParticipantEuaUploader < CarrierWave::Uploader::Base

  storage :fog

  def store_dir
    "participant_euas/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(pdf)
  end

end
