require 'test_helper'

class CookiepagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cookiepages_index_url
    assert_response :success
  end

  test "should get show" do
    get cookiepages_show_url
    assert_response :success
  end

  test "should get new" do
    get cookiepages_new_url
    assert_response :success
  end

  test "should get create" do
    get cookiepages_create_url
    assert_response :success
  end

  test "should get edit" do
    get cookiepages_edit_url
    assert_response :success
  end

  test "should get update" do
    get cookiepages_update_url
    assert_response :success
  end

  test "should get destroy" do
    get cookiepages_destroy_url
    assert_response :success
  end

end
