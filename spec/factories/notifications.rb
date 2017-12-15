FactoryGirl.define do
  factory :notification do
    participant nil
    notification "MyString"
    notifiable nil
    read_at "2017-12-15 13:17:47"
  end
end
