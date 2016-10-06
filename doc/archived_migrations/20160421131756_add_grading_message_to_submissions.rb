class AddGradingMessageToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :grading_message, :string
  end
end
