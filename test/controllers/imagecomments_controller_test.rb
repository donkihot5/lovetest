require 'test_helper'

class ImagecommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get imagecomments_index_url
    assert_response :success
  end

  test "should get show" do
    get imagecomments_show_url
    assert_response :success
  end

  test "should get new" do
    get imagecomments_new_url
    assert_response :success
  end

  test "should get create" do
    get imagecomments_create_url
    assert_response :success
  end

  test "should get edit" do
    get imagecomments_edit_url
    assert_response :success
  end

  test "should get update" do
    get imagecomments_update_url
    assert_response :success
  end

  test "should get destroy" do
    get imagecomments_destroy_url
    assert_response :success
  end

end
