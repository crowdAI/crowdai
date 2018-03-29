class ConvertData < ActiveRecord::Migration[5.1]
  def change
    Challenge.all.each do |c|
      ChallengeOrganizer.create!(
        challenge_id: c.id,
        organizer_id: c.organizer_id,
        seq: 0
      )
    end
    change_column :challenge_organizers, :seq, :integer, default: 0
  end

end
