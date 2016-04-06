FactoryGirl.define do
  factory :timeline do
    challenge { FactoryGirl.create :challenge }
    seq 1
    event "Final submission deadline."
    event_time "2016-02-08 22:42:46"
  end
end
