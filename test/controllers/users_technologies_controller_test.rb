require "test_helper"

class UsersTechnologiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_technology = users_technologies(:one)
  end

  test "should get index" do
    get users_technologies_url, as: :json
    assert_response :success
  end

  test "should create users_technology" do
    assert_difference('UsersTechnology.count') do
      post users_technologies_url, params: { users_technology: { technology_id: @users_technology.technology_id, user_id: @users_technology.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show users_technology" do
    get users_technology_url(@users_technology), as: :json
    assert_response :success
  end

  test "should update users_technology" do
    patch users_technology_url(@users_technology), params: { users_technology: { technology_id: @users_technology.technology_id, user_id: @users_technology.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy users_technology" do
    assert_difference('UsersTechnology.count', -1) do
      delete users_technology_url(@users_technology), as: :json
    end

    assert_response 204
  end
end
