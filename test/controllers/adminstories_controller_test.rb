require 'test_helper'

class AdminstoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adminstories_index_url
    assert_response :success
  end

  test "should get show" do
    get adminstories_show_url
    assert_response :success
  end

  test "should get new" do
    get adminstories_new_url
    assert_response :success
  end

  test "should get create" do
    get adminstories_create_url
    assert_response :success
  end

  test "should get edit" do
    get adminstories_edit_url
    assert_response :success
  end

  test "should get update" do
    get adminstories_update_url
    assert_response :success
  end

  test "should get destroy" do
    get adminstories_destroy_url
    assert_response :success
  end

end
