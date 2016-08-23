require 'test_helper'

class DspaceCommunitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dspace_community = dspace_communities(:one)
  end

  test "should get index" do
    get dspace_communities_url
    assert_response :success
  end

  test "should get new" do
    get new_dspace_community_url
    assert_response :success
  end

  test "should create dspace_community" do
    assert_difference('DspaceCommunity.count') do
      post dspace_communities_url, params: { dspace_community: {  } }
    end

    assert_redirected_to dspace_community_url(DspaceCommunity.last)
  end

  test "should show dspace_community" do
    get dspace_community_url(@dspace_community)
    assert_response :success
  end

  test "should get edit" do
    get edit_dspace_community_url(@dspace_community)
    assert_response :success
  end

  test "should update dspace_community" do
    patch dspace_community_url(@dspace_community), params: { dspace_community: {  } }
    assert_redirected_to dspace_community_url(@dspace_community)
  end

  test "should destroy dspace_community" do
    assert_difference('DspaceCommunity.count', -1) do
      delete dspace_community_url(@dspace_community)
    end

    assert_redirected_to dspace_communities_url
  end
end
