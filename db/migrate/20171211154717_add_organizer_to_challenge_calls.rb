class AddOrganizerToChallengeCalls < ActiveRecord::Migration[5.1]
  def change
    add_reference :challenge_calls, :organizer, index: true
  end
end
