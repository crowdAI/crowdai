FactoryBot.define do
  factory :participant_clef_task, class: ParticipantClefTask do
    clef_task
    participant
    approved false
    status_cd 'requested'
  end
end
