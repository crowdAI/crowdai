FactoryGirl.define do
  factory :participant_challenge, class: ParticipantChallenge do
    participant nil
    challenge nil
    rules_accepted false
  end
end
