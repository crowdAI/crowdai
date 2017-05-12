module ApiKey

  def set_api_key
    if self.api_key.blank?
      self.api_key = generate_api_key
    end
  end

  def generate_api_key
    api_key = nil
    begin
      api_key = SecureRandom.hex
    end while (Participant.exists?(api_key: api_key) || Organizer.exists?(api_key: api_key) || Challenge.exists?(api_key: api_key))
    return api_key
  end

end
