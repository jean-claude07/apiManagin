require 'test_helper'

class ChoixquestiondebutantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @choixquestiondebutant = choixquestiondebutants(:one)
  end

  test "should get index" do
    get choixquestiondebutants_url, as: :json
    assert_response :success
  end

  test "should create choixquestiondebutant" do
    assert_difference('Choixquestiondebutant.count') do
      post choixquestiondebutants_url, params: { choixquestiondebutant: { choix: @choixquestiondebutant.choix } }, as: :json
    end

    assert_response 201
  end

  test "should show choixquestiondebutant" do
    get choixquestiondebutant_url(@choixquestiondebutant), as: :json
    assert_response :success
  end

  test "should update choixquestiondebutant" do
    patch choixquestiondebutant_url(@choixquestiondebutant), params: { choixquestiondebutant: { choix: @choixquestiondebutant.choix } }, as: :json
    assert_response 200
  end

  test "should destroy choixquestiondebutant" do
    assert_difference('Choixquestiondebutant.count', -1) do
      delete choixquestiondebutant_url(@choixquestiondebutant), as: :json
    end

    assert_response 204
  end
end
