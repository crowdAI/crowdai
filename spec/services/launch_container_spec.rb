require 'rails_helper'

RSpec.describe LaunchContainer do
  let!(:docker_configuration) { create(:docker_configuration, :with_files) }
  let!(:launch_container) { LaunchContainer.new(docker_configuration.id) }

  describe 'can be instantiated' do
    specify { expect(launch_container).to be_a LaunchContainer }
    specify { expect(ContainerInstance.last.status).to eq(:initialized) }
    specify { expect change(ContainerInstance, :count).by(1) }
  end

  describe 'builds a Docker container on the docker-machine' do
    before { launch_container.build }
    specify { expect(ContainerInstance.last.status).to eq(:built) }
    specify { expect(ContainerInstance.last.image_sha.length).to eq(12) }
    specify { expect(ContainerInstance.last.container_sha.length).to eq(64) }
  end

  describe 'starts a Docker container instance on the docker-machine' do
    before { launch_container.start }
    specify { expect(ContainerInstance.last.status).to eq(:started) }
    specify { expect(ContainerLog.count).to eq(2) }
    specify { expect(ContainerLog.last.message).to eq('Container started') }
  end
end
