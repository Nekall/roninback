require "test_helper"

class UsersBadgesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_badge = users_badges(:one)
  end

  test "should get index" do
    get users_badges_url, as: :json
    assert_response :success
  end

  test "should create users_badge" do
    assert_difference('UsersBadge.count') do
      post users_badges_url, params: { users_badge: { badge_id: @users_badge.badge_id, user_id: @users_badge.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show users_badge" do
    get users_badge_url(@users_badge), as: :json
    assert_response :success
  end

  test "should update users_badge" do
    patch users_badge_url(@users_badge), params: { users_badge: { badge_id: @users_badge.badge_id, user_id: @users_badge.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy users_badge" do
    assert_difference('UsersBadge.count', -1) do
      delete users_badge_url(@users_badge), as: :json
    end

    assert_response 204
  end
end
