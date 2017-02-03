class AddStartDttmToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :start_dttm, :datetime
    add_column :challenges, :end_dttm, :datetime

  end
end
