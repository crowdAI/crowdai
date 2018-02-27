class ConvertDttm < ActiveRecord::Migration[5.1]
  def change
    rnds = ChallengeRound.all
    rnds.each do |r|
      r.start_dttm = r.start_date.to_datetime + r.start_time.seconds_since_midnight.seconds
      r.end_dttm = r.end_date.to_datetime + r.end_time.seconds_since_midnight.seconds
      r.save
    end
  end
end
