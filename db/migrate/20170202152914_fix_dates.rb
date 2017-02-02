class FixDates < ActiveRecord::Migration[5.0]
  def change
    c = Challenge.all
    c.each do |challenge|
      challenge.start_dttm = challenge.timeline.start_dttm
      challenge.end_dttm = challenge.timeline.end_dttm
      challenge.save!
    end
  end
end
