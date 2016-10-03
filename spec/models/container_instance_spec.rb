require 'spec_helper'

describe ContainerInstance do
  context 'associations' do
    it { should belong_to(:docker_configuration) }
    it { should belong_to(:submission) }
    it { should have_many(:container_logs).dependent(:destroy) }
  end

  context 'validations' do
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:docker_configuration_id) }
  end

end
