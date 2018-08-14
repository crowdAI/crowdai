class ParticipantSignUpsQuery

  def call
    ActiveRecord::Base.connection.select_rows(sql)
  end

  def sql
    sql = %Q[
      SELECT COUNT(id), date_trunc('DAY',created_at)::DATE AS created_date
      FROM participants
      GROUP BY 2
      ORDER BY 2 DESC
      LIMIT 7
    ]
  end

end
