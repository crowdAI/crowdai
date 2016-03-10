class Leaderboard < ActiveRecord::Base
  self.primary_key = :id
  self.table_name = 'submissions'
  after_initialize :readonly!

  belongs_to :competition
  belongs_to :user

  def self.sql_view
    sql = %Q[
      select * from submissions
    ]
    self.find_by_sql(query)
  end
end
