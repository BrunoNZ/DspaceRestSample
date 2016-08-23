require 'test_helper'

class DspaceBitstreamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dspace_bitstream = dspace_bitstreams(:one)
  end

  test "should get index" do
    get dspace_bitstreams_url
    assert_response :success
  end

  test "should get new" do
    get new_dspace_bitstream_url
    assert_response :success
  end

  test "should create dspace_bitstream" do
    assert_difference('DspaceBitstream.count') do
      post dspace_bitstreams_url, params: { dspace_bitstream: {  } }
    end

    assert_redirected_to dspace_bitstream_url(DspaceBitstream.last)
  end

  test "should show dspace_bitstream" do
    get dspace_bitstream_url(@dspace_bitstream)
    assert_response :success
  end

  test "should get edit" do
    get edit_dspace_bitstream_url(@dspace_bitstream)
    assert_response :success
  end

  test "should update dspace_bitstream" do
    patch dspace_bitstream_url(@dspace_bitstream), params: { dspace_bitstream: {  } }
    assert_redirected_to dspace_bitstream_url(@dspace_bitstream)
  end

  test "should destroy dspace_bitstream" do
    assert_difference('DspaceBitstream.count', -1) do
      delete dspace_bitstream_url(@dspace_bitstream)
    end

    assert_redirected_to dspace_bitstreams_url
  end
end
