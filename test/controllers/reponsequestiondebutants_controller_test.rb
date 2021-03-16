require 'test_helper'

class ReponsequestiondebutantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reponsequestiondebutant = reponsequestiondebutants(:one)
  end

  test "should get index" do
    get reponsequestiondebutants_url, as: :json
    assert_response :success
  end

  test "should create reponsequestiondebutant" do
    assert_difference('Reponsequestiondebutant.count') do
      post reponsequestiondebutants_url, params: { reponsequestiondebutant: { reponse: @reponsequestiondebutant.reponse } }, as: :json
    end

    assert_response 201
  end

  test "should show reponsequestiondebutant" do
    get reponsequestiondebutant_url(@reponsequestiondebutant), as: :json
    assert_response :success
  end

  test "should update reponsequestiondebutant" do
    patch reponsequestiondebutant_url(@reponsequestiondebutant), params: { reponsequestiondebutant: { reponse: @reponsequestiondebutant.reponse } }, as: :json
    assert_response 200
  end

  test "should destroy reponsequestiondebutant" do
    assert_difference('Reponsequestiondebutant.count', -1) do
      delete reponsequestiondebutant_url(@reponsequestiondebutant), as: :json
    end

    assert_response 204
  end
end
