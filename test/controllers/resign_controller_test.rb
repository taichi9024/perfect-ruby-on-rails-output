require 'test_helper'

class ResignControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get resign_new_url
    assert_response :success
  end

end
