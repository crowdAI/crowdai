class Challenge::Cell::ChallengeSubnav < Cell::Concept
  inherit_views Challenge::Cell

  def show
    render :challenge_subnav
  end

  def challenges
    model
  end

  def challenge_filter
    options[:challenge_filter]
  end

  def challenges_count(challenge_filter)
    case challenge_filter
    when 'all'
      return all_challenges_count
    when 'active'
      return active_challenges_count
    when 'completed'
      return completed_challenges_count
    end
  end

  def all_challenges_count
    challenges.count
  end

  def active_challenges_count
    challenges.select { |c| c.status == :running }.count
  end

  def completed_challenges_count
    challenges.select { |c| c.status == :completed }.count
  end

end
