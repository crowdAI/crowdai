FactoryGirl.define do
  factory :follow, class: Follow do
    association :followable, factory: :challenge
    participant
  end
end
