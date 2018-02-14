require 'test_helper'

class GhelppagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ghelppages_index_url
    assert_response :success
  end

end
