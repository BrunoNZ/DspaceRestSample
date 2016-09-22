require 'test_helper'

class DspaceMetadataFieldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dspace_metadata_field = dspace_metadata_fields(:one)
  end

  test "should get index" do
    get dspace_metadata_fields_url
    assert_response :success
  end

  test "should get new" do
    get new_dspace_metadata_field_url
    assert_response :success
  end

  test "should create dspace_metadata_field" do
    assert_difference('DspaceMetadataField.count') do
      post dspace_metadata_fields_url, params: { dspace_metadata_field: {  } }
    end

    assert_redirected_to dspace_metadata_field_url(DspaceMetadataField.last)
  end

  test "should show dspace_metadata_field" do
    get dspace_metadata_field_url(@dspace_metadata_field)
    assert_response :success
  end

  test "should get edit" do
    get edit_dspace_metadata_field_url(@dspace_metadata_field)
    assert_response :success
  end

  test "should update dspace_metadata_field" do
    patch dspace_metadata_field_url(@dspace_metadata_field), params: { dspace_metadata_field: {  } }
    assert_redirected_to dspace_metadata_field_url(@dspace_metadata_field)
  end

  test "should destroy dspace_metadata_field" do
    assert_difference('DspaceMetadataField.count', -1) do
      delete dspace_metadata_field_url(@dspace_metadata_field)
    end

    assert_redirected_to dspace_metadata_fields_url
  end
end
