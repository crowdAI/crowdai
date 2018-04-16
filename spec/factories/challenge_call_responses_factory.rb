FactoryBot.define do
  factory :challenge_call_response do
    challenge_call
    contact_name 'Joe Bloggs'
    email 'joe@bloggs.com.au'
    phone '12345'
    organization 'Blogger'
    challenge_title 'A test challenge'
    challenge_description 'A super cool challenge'
    motivation 'Description of the reasons why the challenge should happen.'
    timeline '2nd week in July, round 2 in August'
    evaluation_criteria 'F1 score'
    organizers_bio 'Person 1 is a professor of econmics, person 2 is a researcher in fluid dynamics'
    other 'some other stuff'

    trait :invalid do
      contact_name nil
    end
  end
end
