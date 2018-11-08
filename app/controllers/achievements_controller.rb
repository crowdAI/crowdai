class AchievementsController < ApplicationController
  before_action :set_badge_counts
  before_action :set_participants, only: [:show]

  def index
    @achievements = Merit::Badge.all
  end

  def show
    @achievement = Merit::Badge.find(params[:id].to_i)
  end

  def set_badge_counts
    @badge_stats = BadgeStat.all
  end

  def set_participants
    sql = "select p.id, p.name, b.created_at from participants p, badges_sashes b where p.sash_id = b.sash_id and b.badge_id = #{params[:id].to_i} order by 3 desc"
    @participants = Participant.find_by_sql(sql)
  end

end
