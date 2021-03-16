require 'test_helper'

class QuestiondebutantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @questiondebutant = questiondebutants(:one)
  end

  test "should get index" do
    get questiondebutants_url, as: :json
    assert_response :success
  end

  test "should create questiondebutant" do
    assert_difference('Questiondebutant.count') do
      post questiondebutants_url, params: { questiondebutant: { question: @questiondebutant.question } }, as: :json
    end

    assert_response 201
  end

  test "should show questiondebutant" do
    get questiondebutant_url(@questiondebutant), as: :json
    assert_response :success
  end

  test "should update questiondebutant" do
    patch questiondebutant_url(@questiondebutant), params: { questiondebutant: { question: @questiondebutant.question } }, as: :json
    assert_response 200
  end

  test "should destroy questiondebutant" do
    assert_difference('Questiondebutant.count', -1) do
      delete questiondebutant_url(@questiondebutant), as: :json
    end

    assert_response 204
  end
end
