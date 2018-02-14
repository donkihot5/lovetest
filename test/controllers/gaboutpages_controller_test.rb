require 'test_helper'

class GaboutpagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gaboutpages_index_url
    assert_response :success
  end

end
