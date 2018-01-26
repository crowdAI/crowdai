class Challenge::Cell::ChallengesSubnav < Challenge::Cell

  def show
    render :challenges_subnav
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
      challenges_count = all_challenges_count
    when 'active'
      challenges_count = active_challenges_count
    when 'completed'
      challenges_count = completed_challenges_count
    when 'draft'
      challenges_count = draft_challenges_count
    end
    challenges_count = nil if challenges_count == 0
    return challenges_count
  end

  def all_challenges_count
    challenges.count
  end

  def active_challenges_count
    statuses = [:running, :starting_soon]
    challenges.select { |c| statuses.include?(c.status) }.count
  end

  def completed_challenges_count
    statuses = [:completed, :perpetual]
    challenges.select { |c| statuses.include?(c.status) }.count
  end

  def draft_challenges_count
    return 0 unless current_participant &&  current_participant.admin?
    statuses = [:draft]
    challenges.select { |c| statuses.include?(c.status) }.count
  end

end
