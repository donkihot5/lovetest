require 'test_helper'

class AdminimagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adminimages_index_url
    assert_response :success
  end

  test "should get show" do
    get adminimages_show_url
    assert_response :success
  end

  test "should get new" do
    get adminimages_new_url
    assert_response :success
  end

  test "should get create" do
    get adminimages_create_url
    assert_response :success
  end

  test "should get edit" do
    get adminimages_edit_url
    assert_response :success
  end

  test "should get update" do
    get adminimages_update_url
    assert_response :success
  end

  test "should get destroy" do
    get adminimages_destroy_url
    assert_response :success
  end

end
