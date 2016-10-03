require 'spec_helper'

describe DockerFile do
  context 'associations' do
    it { should belong_to(:docker_configuration) }
  end

  context 'validations' do
    it { should validate_presence_of(:configuration_file_s3_key) }
    it { should validate_presence_of(:directory) }
  end
end
