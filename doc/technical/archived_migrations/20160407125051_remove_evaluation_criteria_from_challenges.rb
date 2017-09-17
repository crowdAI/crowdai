class RemoveEvaluationCriteriaFromChallenges < ActiveRecord::Migration
  def change
    remove_column :challenges, :evaluation_criteria, :text
  end
end
