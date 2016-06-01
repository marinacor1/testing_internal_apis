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
      post :create, item: item_params, format: :json #params, can use string or symbol for create
      item = Item.last

      assert_response :success
      assert_equal item.name, item_params[:name]
    end

    test "can update item" do
      id = Item.first.id
      previous_name = Item.first.name
      item_params = { name: "NEW NAME"}

      put :update, id: id, item: item_params, format: :json
      item = Item.find_by(id: id)

      assert_response :success
      refute_equal previous_name, item.name
      assert_equal "NEW NAME", item.name
    end

    test "can delete an item" do
      item = Item.last

      delete :destroy, id: item.id, format: :json

      assert_response :success
      refute Item.find_by(id: item.id)
    end
end
