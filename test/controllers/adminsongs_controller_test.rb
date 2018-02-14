require 'test_helper'

class AdminsongsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adminsongs_index_url
    assert_response :success
  end

  test "should get show" do
    get adminsongs_show_url
    assert_response :success
  end

  test "should get new" do
    get adminsongs_new_url
    assert_response :success
  end

  test "should get create" do
    get adminsongs_create_url
    assert_response :success
  end

  test "should get edit" do
    get adminsongs_edit_url
    assert_response :success
  end

  test "should get update" do
    get adminsongs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get adminsongs_destroy_url
    assert_response :success
  end

end
