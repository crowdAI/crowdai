class LeaderboardWindows < ActiveRecord::Migration[5.1]
  def change
    execute "update challenges set ranking_window = 96, ranking_highlight =3;"
  end
end
