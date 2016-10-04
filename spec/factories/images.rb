FactoryGirl.define do
  factory :image do
    image { File.new("#{Rails.root}/spec/support/files/p_image10.jpg") }
    association :imageable, factory: :challenge
  end
end
