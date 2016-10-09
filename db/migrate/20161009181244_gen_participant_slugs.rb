class GenParticipantSlugs < ActiveRecord::Migration
  def change
    Participant.find_each(&:save)
  end
end
