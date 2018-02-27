class AddChallengeTitleToChallengeCallResponses < ActiveRecord::Migration[5.1]
  def change
    add_column :challenge_call_responses, :challenge_title, :string
    add_column :challenge_call_responses, :motivation, :text
    add_column :challenge_call_responses, :timeline, :text
    add_column :challenge_call_responses, :evaluation_criteria, :text
    add_column :challenge_call_responses, :organizers_bio, :text
    add_column :challenge_call_responses, :other, :text
  end
end
