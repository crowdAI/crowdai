require 'spec_helper'

describe ContainerLog do
  context 'associations' do
    it { should belong_to(:container_instance) }
  end

  context 'validations' do
    it { should validate_presence_of(:container_instance_id) }
    it { should validate_presence_of(:log_level) }
    it { should validate_presence_of(:log_source) }
  end
end
