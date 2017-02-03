class FixNameCollisions < ActiveRecord::Migration[5.0]
  def change
    participants = Participant.where(api_key: nil)
    participants.each do |p|
      p.name = "#{p.name}_#{p.id}"
      p.set_api_key
      p.save!
    end
  end
end
