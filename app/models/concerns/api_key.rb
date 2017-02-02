module ApiKey

  def generate_api_key
    api_key = nil
    begin
      api_key = SecureRandom.hex
    end while (Participant.exists?(api_key: api_key) || Organizer.exists?(api_key: api_key))
    return api_key
  end
  
end
