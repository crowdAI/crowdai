class AddEvaluationRenderedToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :evaluation_rendered, :text
  end
end
