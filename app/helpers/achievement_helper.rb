module AchievementHelper

  def awarded_message(badge_id:,badge_stats:)
    cnt = badge_stats
      .detect {|a| a.badge_id == badge_id}
      .try(:badge_count)
    if cnt.present?
      if cnt == 1
        msg = "Awarded once"
      else
        msg = "Awarded #{cnt} times"
      end
    else
      msg = "Not yet awarded"
    end
    msg.html_safe
  end

  def percentile(badge:,badge_stats:)
    percentile = badge_stats
      .detect {|a| a.badge_id == badge.id}
      .try(:percentile)
    if percentile.present?
      klass = "badge badge-#{badge.custom_fields[:level]}"
      html = "<span class='#{klass}'>Top #{percentile.to_i}%</span>"
    end
    html.html_safe
  end

end
