FactoryGirl.define do
  factory :clef_task, class: ClefTask do
    association :organizer, :clef
    task FFaker::Lorem.sentence(3)

    trait :with_eua do
      after :create do |c|
        c.update_column(:eua_file, "spec/support/files/test_pdf_file.pdf")
      end
    end

    trait :life_clef do
      task_dataset_files { [ build(:task_dataset_file, title: 'file 1'),
                          build(:task_dataset_file, title: 'file 2'),
                          build(:task_dataset_file, title: 'file 3') ] }
    end

    trait :image_clef do
      task_dataset_files { [ build(:task_dataset_file, title: 'file 1'),
                          build(:task_dataset_file, title: 'file 2'),
                          build(:task_dataset_file, title: 'file 3') ] }
      after :create do |c|
        c.update_column(:eua_file, "spec/support/files/test_pdf_file.pdf")
      end
    end

    trait :invalid do
      task nil
    end
  end
end
