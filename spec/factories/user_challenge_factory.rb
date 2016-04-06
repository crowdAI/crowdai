FactoryGirl.define do
  factory :user_challenge, class: UserChallenge do
    user nil
    challenge nil
    rules_accepted false
  end
end
