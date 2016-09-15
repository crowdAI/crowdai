require 'rails_helper'

RSpec.describe LaunchSubmission do
  let!(:challenge) { create(:challenge) }
  let!(:docker_configuration) { create(:docker_configuration, :with_files, challenge_id: challenge.id) }
  let!(:submission) { create(:submission, challenge_id: challenge.id, docker_configuration_id: docker_configuration.id) }
  let!(:launch_submission) { LaunchSubmission.new(docker_configuration.id,submission.id) }

  describe 'can be instantiated' do
    specify { expect(launch_submission).to be_a LaunchSubmission }
    specify { expect(ContainerInstance.last.status).to eq(:initialized) }
    specify { expect change(ContainerInstance, :count).by(1) }
  end

  describe 'builds a Docker container on the docker-machine' do
    before { launch_submission.build }
    specify { expect(ContainerInstance.last.status).to eq(:built) }
    specify { expect(ContainerInstance.last.image_sha.length).to eq(12) }
    specify { expect(ContainerInstance.last.container_sha.length).to eq(64) }
  end

  describe 'starts a Docker container instance on the docker-machine' do
    before { launch_submission.start }
    specify { expect(ContainerInstance.last.status).to eq(:started) }
    specify { expect(ContainerLog.count).to eq(2) }
    specify { expect(ContainerLog.last.message).to eq('Container started') }
  end
end
