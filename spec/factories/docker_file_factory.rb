FactoryGirl.define do
  factory :docker_file, class: DockerFile do
    docker_configuration { FactoryGirl.create :docker_configuration }
    configuration_file_s3_key 'callback.sh'
    directory 'scripts/docker/'
  end
end
