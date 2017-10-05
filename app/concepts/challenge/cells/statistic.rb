class Challenge::Cell::Statistic < Challenge::Cell

  def show
    render :statistic
  end

  def stat_type
    options[:type]
  end

  def challenge
    model
  end

  def stat_count
    case stat_type
    when 'submission'
      formatted_count(challenge.submission_count)
    when 'view'
      formatted_count(challenge.page_views)
    when 'participant'
      formatted_count(challenge.participant_count)
    end
  end

  def formatted_count(counter)
    if counter > 10000
      "#{sprintf('%.1f', counter/1000.0).chomp('.0')} k"
    else
      counter
    end
  end

  def stat_text
    "#{stat_type.titlecase}".pluralize(challenge.submission_count).html_safe
  end

end
