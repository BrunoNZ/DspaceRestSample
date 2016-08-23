require 'test_helper'

class DspaceCollectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dspace_collection = dspace_collections(:one)
  end

  test "should get index" do
    get dspace_collections_url
    assert_response :success
  end

  test "should get new" do
    get new_dspace_collection_url
    assert_response :success
  end

  test "should create dspace_collection" do
    assert_difference('DspaceCollection.count') do
      post dspace_collections_url, params: { dspace_collection: {  } }
    end

    assert_redirected_to dspace_collection_url(DspaceCollection.last)
  end

  test "should show dspace_collection" do
    get dspace_collection_url(@dspace_collection)
    assert_response :success
  end

  test "should get edit" do
    get edit_dspace_collection_url(@dspace_collection)
    assert_response :success
  end

  test "should update dspace_collection" do
    patch dspace_collection_url(@dspace_collection), params: { dspace_collection: {  } }
    assert_redirected_to dspace_collection_url(@dspace_collection)
  end

  test "should destroy dspace_collection" do
    assert_difference('DspaceCollection.count', -1) do
      delete dspace_collection_url(@dspace_collection)
    end

    assert_redirected_to dspace_collections_url
  end
end
