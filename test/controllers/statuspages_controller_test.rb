require 'test_helper'

class StatuspagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get statuspages_index_url
    assert_response :success
  end

  test "should get show" do
    get statuspages_show_url
    assert_response :success
  end

  test "should get new" do
    get statuspages_new_url
    assert_response :success
  end

  test "should get create" do
    get statuspages_create_url
    assert_response :success
  end

  test "should get edit" do
    get statuspages_edit_url
    assert_response :success
  end

  test "should get update" do
    get statuspages_update_url
    assert_response :success
  end

  test "should get destroy" do
    get statuspages_destroy_url
    assert_response :success
  end

end
