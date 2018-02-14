require 'test_helper'

class AdspagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adspages_index_url
    assert_response :success
  end

  test "should get show" do
    get adspages_show_url
    assert_response :success
  end

  test "should get new" do
    get adspages_new_url
    assert_response :success
  end

  test "should get create" do
    get adspages_create_url
    assert_response :success
  end

  test "should get edit" do
    get adspages_edit_url
    assert_response :success
  end

  test "should get update" do
    get adspages_update_url
    assert_response :success
  end

  test "should get destroy" do
    get adspages_destroy_url
    assert_response :success
  end

end
