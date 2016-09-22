require 'test_helper'

class DspaceSchemasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dspace_schema = dspace_schemas(:one)
  end

  test "should get index" do
    get dspace_schemas_url
    assert_response :success
  end

  test "should get new" do
    get new_dspace_schema_url
    assert_response :success
  end

  test "should create dspace_schema" do
    assert_difference('DspaceSchema.count') do
      post dspace_schemas_url, params: { dspace_schema: {  } }
    end

    assert_redirected_to dspace_schema_url(DspaceSchema.last)
  end

  test "should show dspace_schema" do
    get dspace_schema_url(@dspace_schema)
    assert_response :success
  end

  test "should get edit" do
    get edit_dspace_schema_url(@dspace_schema)
    assert_response :success
  end

  test "should update dspace_schema" do
    patch dspace_schema_url(@dspace_schema), params: { dspace_schema: {  } }
    assert_redirected_to dspace_schema_url(@dspace_schema)
  end

  test "should destroy dspace_schema" do
    assert_difference('DspaceSchema.count', -1) do
      delete dspace_schema_url(@dspace_schema)
    end

    assert_redirected_to dspace_schemas_url
  end
end
