class Participant::Cell::ParticipantSubnav < Cell::Concept
  inherit_views Participant::Cell

  def show
    render :participant_subnav
  end

  def participant
    model
  end

  def challenges
    Challenge.all
    #Challenge.where(id: participant.participant_challenges.collect(&:challenge_id))
  end

  def challenges_count
    challenges_count = challenges.count
    return nil if challenges_count == 0
    return challenges_count
  end

  def articles
    #participant.articles
    Article.all
  end

  def articles_count
    articles_count = articles.count
    return nil if articles_count == 0
    return articles_count
  end

end
