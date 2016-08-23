require 'test_helper'

class DspaceItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dspace_item = dspace_items(:one)
  end

  test "should get index" do
    get dspace_items_url
    assert_response :success
  end

  test "should get new" do
    get new_dspace_item_url
    assert_response :success
  end

  test "should create dspace_item" do
    assert_difference('DspaceItem.count') do
      post dspace_items_url, params: { dspace_item: {  } }
    end

    assert_redirected_to dspace_item_url(DspaceItem.last)
  end

  test "should show dspace_item" do
    get dspace_item_url(@dspace_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_dspace_item_url(@dspace_item)
    assert_response :success
  end

  test "should update dspace_item" do
    patch dspace_item_url(@dspace_item), params: { dspace_item: {  } }
    assert_redirected_to dspace_item_url(@dspace_item)
  end

  test "should destroy dspace_item" do
    assert_difference('DspaceItem.count', -1) do
      delete dspace_item_url(@dspace_item)
    end

    assert_redirected_to dspace_items_url
  end
end
