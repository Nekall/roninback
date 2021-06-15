require "test_helper"

class RessourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ressource = ressources(:one)
  end

  test "should get index" do
    get ressources_url, as: :json
    assert_response :success
  end

  test "should create ressource" do
    assert_difference('Ressource.count') do
      post ressources_url, params: { ressource: { content: @ressource.content, title: @ressource.title } }, as: :json
    end

    assert_response 201
  end

  test "should show ressource" do
    get ressource_url(@ressource), as: :json
    assert_response :success
  end

  test "should update ressource" do
    patch ressource_url(@ressource), params: { ressource: { content: @ressource.content, title: @ressource.title } }, as: :json
    assert_response 200
  end

  test "should destroy ressource" do
    assert_difference('Ressource.count', -1) do
      delete ressource_url(@ressource), as: :json
    end

    assert_response 204
  end
end
