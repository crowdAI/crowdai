class Challenge::Cell::ChallengeSubnav < Cell::Concept
  inherit_views Challenge::Cell

  def show
    render :challenge_subnav
  end

  def challenge
    model
  end

end
