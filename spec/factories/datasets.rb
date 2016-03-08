FactoryGirl.define do
  factory :dataset do
    competition { FactoryGirl.create :competition }
    description "Baseline Data"
  end
end
