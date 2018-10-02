class CompletedChallengeBadgesService

  def initialize(challenge_id)
    round = ChallengeRoundSummary.where(challenge_id: challenge_id).order(row_num: :asc).limit(1)
    @leaderboards = Leaderboard.where(
        challenge_id: challenge_id,
        challenge_round_id: round.id,
        baseline: false)
      .order(row_num: :asc)
      .limit(10)
  end

  def call
    participant_ids = assign_points
    grant_badges(participant_ids)
  end

  def assign_points
    @leaderboards.each_with_index do |row,idx|
      participant = Participant.find(row.partipant_id)
      if idx == 0
        participant.add_points(1, category: 'challenge-winner')
        participant.add_points(1, category: 'top5-completed')
        participant.add_points(1, category: 'top10-completed')
      end
      if idx.between?(0,4)
        participant.add_points(1, category: 'top5-completed')
        participant.add_points(1, category: 'top10-completed')
      end
      if idx > 5
        participant.add_points(1, category: 'top10-completed')
      end
    end
  end

  def grant_badges
    @leaderboard.each do |row|
      participant = Participant.find(row.participant_id)
      case participant.points(category: 'challenge-winner')
      when 1
        badge = Merit::Badge.detect{|b| b.name == 'winner-bronze'}
        participant.add_badge(badge.id)
      when 2
        badge = Merit::Badge.detect{|b| b.name == 'winner-silver'}
        participant.add_badge(badge.id)
      when 3
        badge = Merit::Badge.detect{|b| b.name == 'winner-gold'}
        participant.add_badge(badge.id)
      end

      case participant.points(category: 'top5-completed')
      when 1
        badge = Merit::Badge.detect{|b| b.name == 'top5-completed-bronze'}
        participant.add_badge(badge.id)
      when 5
        badge = Merit::Badge.detect{|b| b.name == 'top5-completed-silver'}
        participant.add_badge(badge.id)
      when 10
        badge = Merit::Badge.detect{|b| b.name == 'top5-completed-gold'}
        participant.add_badge(badge.id)
      end

      case participant.points(category: 'top10-completed')
      when 3
        badge = Merit::Badge.detect{|b| b.name == 'top10-completed-bronze'}
        participant.add_badge(badge.id)
      when 5
        badge = Merit::Badge.detect{|b| b.name == 'top10-completed-silver'}
        participant.add_badge(badge.id)
      when 20
        badge = Merit::Badge.detect{|b| b.name == 'top10-completed-gold'}
        participant.add_badge(badge.id)
      end
    end
  end

end
