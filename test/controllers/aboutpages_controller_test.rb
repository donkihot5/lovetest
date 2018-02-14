require 'test_helper'

class AboutpagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get aboutpages_index_url
    assert_response :success
  end

  test "should get show" do
    get aboutpages_show_url
    assert_response :success
  end

  test "should get new" do
    get aboutpages_new_url
    assert_response :success
  end

  test "should get create" do
    get aboutpages_create_url
    assert_response :success
  end

  test "should get edit" do
    get aboutpages_edit_url
    assert_response :success
  end

  test "should get update" do
    get aboutpages_update_url
    assert_response :success
  end

  test "should get destroy" do
    get aboutpages_destroy_url
    assert_response :success
  end

end
