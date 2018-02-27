class Sublimit < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :submission_limit, :integer
    add_column :challenges, :submission_limit_period_id, :string
  end
end
