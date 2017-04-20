class Challenge::Cell::Stats < Cell::Concept
  inherit_views Challenge::Cell

  def show
    render :stats
  end

  def challenges
    model
  end

  def all_challenges
    challenges.count
  end

  def active_challenges
    challenges.select { |c| c.status == :running }.count
  end

  def completed_challenges
    challenges.select { |c| c.status == :completed }.count
  end

end
