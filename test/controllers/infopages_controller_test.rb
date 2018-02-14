require 'test_helper'

class InfopagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get infopages_index_url
    assert_response :success
  end

  test "should get show" do
    get infopages_show_url
    assert_response :success
  end

  test "should get new" do
    get infopages_new_url
    assert_response :success
  end

  test "should get create" do
    get infopages_create_url
    assert_response :success
  end

  test "should get edit" do
    get infopages_edit_url
    assert_response :success
  end

  test "should get update" do
    get infopages_update_url
    assert_response :success
  end

  test "should get destroy" do
    get infopages_destroy_url
    assert_response :success
  end

end
