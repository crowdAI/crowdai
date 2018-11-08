class Leaderboard::Cell::TableRow < Leaderboard::Cell

  def show
    if entry.baseline
      render :baseline_row
    else
      render :table_row
    end
  end

  def entry
    model
  end

  def challenge
    @challenge ||= model.challenge
  end

  def participant
    return NullParticipant.new if entry.participant.blank?
    @participant ||= entry.participant
  end

  def top_rows
    @top_rows ||= challenge_round.ranking_highlight
  end

  def leader_class
    if model.row_num <= top_rows
      return 'leader'
    end
  end

end
