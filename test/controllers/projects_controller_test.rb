require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get projects_new_url
    assert_response :success
  end

  test "should get create" do
    get projects_create_url
    assert_response :success
  end

  test "should get update" do
    get projects_update_url
    assert_response :success
  end

end
