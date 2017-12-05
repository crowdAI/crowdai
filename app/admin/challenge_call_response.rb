ActiveAdmin.register ChallengeCallResponse do
  belongs_to :challenge_call, parent_class: ChallengeCall
  navigation_menu :challenge_call

end
