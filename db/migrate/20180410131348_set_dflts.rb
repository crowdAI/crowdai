class SetDflts < ActiveRecord::Migration[5.1]
  def change
    execute "update challenge_rounds set ranking_highlight = (select ranking_highlight from challenges where challenge_rounds.challenge_id = id);"
    execute "update challenge_rounds set ranking_window = (select ranking_window from challenges where challenge_rounds.challenge_id = id);"
    execute "update challenge_rounds set score_significant_digits = 3, score_secondary_significant_digits = 3;"
  end
end
