class Leaderboard::Cell::TableRow < Leaderboard::Cell

  def show
    render :table_row
  end

  def entry
    model
  end

  def challenge
    @challenge ||= model.challenge
  end

  def participant
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
