class AddCallHeadline < ActiveRecord::Migration[5.1]
  def change
    add_column :challenge_calls, :headline, :string
  end
end
