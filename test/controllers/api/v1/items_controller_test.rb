require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "can visit index" do
    get "index", format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    assert_equal 2, parsed_json.count
    assert parsed_json.first.has_key?("description")

  end

  test "can visit show" do
    id = Item.first.id
    get :show, id: id, format: :json
    item = JSON.parse(response.body)

    assert_response :success

    assert_equal item["id"], id
    end

    test "can visit create" do
      item_params = { name: "Computer", description: "awesome compu"}
      post :create, item: item_params, format: :json
      item = Item.last

      assert_response :success
      assert_equal item.name, item_params[:name]
    end
end
