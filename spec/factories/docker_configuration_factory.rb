FactoryGirl.define do
  factory :docker_configuration, class: DockerConfiguration do
    challenge { FactoryGirl.create :challenge }
    name 'Ubuntu base container'
    image 'ubuntu:14.04'
    mount_point '/project/'
    destroy_after_success true
    execute_on_submission true

    trait :with_files do
      docker_files { [ build(:docker_file, configuration_file_s3_key: 'grade.sh'),
                 build(:docker_file, configuration_file_s3_key: 'install.sh'),
                 build(:docker_file, configuration_file_s3_key: 'run.sh'),
                 build(:docker_file, configuration_file_s3_key: 'callback.sh')] }
    end
  end
end
