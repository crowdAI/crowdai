class M2 < ActiveRecord::Migration
  def change
    Participant.all.each do |p|
      p.email_preferences.create!
    end
  end
end
