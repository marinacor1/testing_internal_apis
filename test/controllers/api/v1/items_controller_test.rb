require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "can visit index" do
    get "index", format: :json
    # parsed_json = JSON.parse(response.body)

    assert_response :success
  end
end
