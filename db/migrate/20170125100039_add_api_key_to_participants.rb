class AddApiKeyToParticipants < ActiveRecord::Migration[5.0]
  def change
    add_column :participants, :api_key, :string
    add_column :organizers, :api_key, :string
    Participant.find_each do |p|
      p.api_key = SecureRandom.hex
      p.save
    end

    Organizer.find_each do |p|
      p.api_key = SecureRandom.hex
      p.save
    end
  end


end
