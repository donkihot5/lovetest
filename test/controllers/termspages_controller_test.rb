require 'test_helper'

class TermspagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get termspages_index_url
    assert_response :success
  end

  test "should get show" do
    get termspages_show_url
    assert_response :success
  end

  test "should get new" do
    get termspages_new_url
    assert_response :success
  end

  test "should get create" do
    get termspages_create_url
    assert_response :success
  end

  test "should get edit" do
    get termspages_edit_url
    assert_response :success
  end

  test "should get update" do
    get termspages_update_url
    assert_response :success
  end

  test "should get destroy" do
    get termspages_destroy_url
    assert_response :success
  end

end
