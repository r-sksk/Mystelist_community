require 'test_helper'

class MysteryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mystery_index_url
    assert_response :success
  end

end
