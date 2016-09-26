require 'spec_helper'

describe DockerConfiguration do
  context 'associations' do
    it { should belong_to(:challenge) }
    it { should have_many(:docker_files).dependent(:destroy) }
    it { should have_many(:container_instances).dependent(:destroy) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:image) }
  end
end
