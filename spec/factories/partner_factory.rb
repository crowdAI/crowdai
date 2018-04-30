FactoryBot.define do
  factory :partner do
    organizer nil
    name 'EPFL'
    visible true
    seq 1
    image_file File.open("#{Rails.root}/spec/support/files/p_image5.jpg", 'r')
  end
end
