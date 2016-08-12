require 'test_helper'

class DockerConfigurationsControllerTest < ActionController::TestCase
  setup do
    @docker_configuration = docker_configurations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:docker_configurations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create docker_configuration" do
    assert_difference('DockerConfiguration.count') do
      post :create, docker_configuration: { challenge_id: @docker_configuration.challenge_id, container: @docker_configuration.container, destroy_after_success: @docker_configuration.destroy_after_success, execute_command: @docker_configuration.execute_command, existing_mount_point: @docker_configuration.existing_mount_point, mount_point: @docker_configuration.mount_point }
    end

    assert_redirected_to docker_configuration_path(assigns(:docker_configuration))
  end

  test "should show docker_configuration" do
    get :show, id: @docker_configuration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @docker_configuration
    assert_response :success
  end

  test "should update docker_configuration" do
    patch :update, id: @docker_configuration, docker_configuration: { challenge_id: @docker_configuration.challenge_id, container: @docker_configuration.container, destroy_after_success: @docker_configuration.destroy_after_success, execute_command: @docker_configuration.execute_command, existing_mount_point: @docker_configuration.existing_mount_point, mount_point: @docker_configuration.mount_point }
    assert_redirected_to docker_configuration_path(assigns(:docker_configuration))
  end

  test "should destroy docker_configuration" do
    assert_difference('DockerConfiguration.count', -1) do
      delete :destroy, id: @docker_configuration
    end

    assert_redirected_to docker_configurations_path
  end
end
