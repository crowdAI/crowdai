FactoryGirl.define do
  factory :clef_task, class: ClefTask do
    association :organizer, :clef
    task FFaker::Lorem.sentence(3)

    trait :with_eua do
      after :create do |c|
        c.update_column(:eua_file, "spec/support/files/test_pdf_file.pdf")
      end
    end

    trait :invalid do
      task nil
    end
  end
end
