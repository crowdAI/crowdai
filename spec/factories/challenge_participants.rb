FactoryBot.define do
  factory :challenge_participant do
    challenge nil
    participant nil
    email "MyString"
    name "MyString"
    registered false
    accepted_toc false
    clef_task_id 1
    clef_eua_file "MyString"
    clef_approved false
    clef_status_cd "MyString"
  end
end
