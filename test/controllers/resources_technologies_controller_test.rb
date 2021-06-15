require "test_helper"

class ResourcesTechnologiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resources_technology = resources_technologies(:one)
  end

  test "should get index" do
    get resources_technologies_url, as: :json
    assert_response :success
  end

  test "should create resources_technology" do
    assert_difference('ResourcesTechnology.count') do
      post resources_technologies_url, params: { resources_technology: { resource_id: @resources_technology.resource_id, technology_id: @resources_technology.technology_id } }, as: :json
    end

    assert_response 201
  end

  test "should show resources_technology" do
    get resources_technology_url(@resources_technology), as: :json
    assert_response :success
  end

  test "should update resources_technology" do
    patch resources_technology_url(@resources_technology), params: { resources_technology: { resource_id: @resources_technology.resource_id, technology_id: @resources_technology.technology_id } }, as: :json
    assert_response 200
  end

  test "should destroy resources_technology" do
    assert_difference('ResourcesTechnology.count', -1) do
      delete resources_technology_url(@resources_technology), as: :json
    end

    assert_response 204
  end
end
