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

end
