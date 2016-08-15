require 'test_helper'

class DockerContainersControllerTest < ActionController::TestCase
  setup do
    @docker_container = docker_containers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:docker_containers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create docker_container" do
    assert_difference('DockerContainer.count') do
      post :create, docker_container: { docker_configuration_id: @docker_container.docker_configuration_id, message: @docker_container.message, status_cd: @docker_container.status_cd }
    end

    assert_redirected_to docker_container_path(assigns(:docker_container))
  end

  test "should show docker_container" do
    get :show, id: @docker_container
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @docker_container
    assert_response :success
  end

  test "should update docker_container" do
    patch :update, id: @docker_container, docker_container: { docker_configuration_id: @docker_container.docker_configuration_id, message: @docker_container.message, status_cd: @docker_container.status_cd }
    assert_redirected_to docker_container_path(assigns(:docker_container))
  end

  test "should destroy docker_container" do
    assert_difference('DockerContainer.count', -1) do
      delete :destroy, id: @docker_container
    end

    assert_redirected_to docker_containers_path
  end
end
