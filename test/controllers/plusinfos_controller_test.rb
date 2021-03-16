require 'test_helper'

class PlusinfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plusinfo = plusinfos(:one)
  end

  test "should get index" do
    get plusinfos_url, as: :json
    assert_response :success
  end

  test "should create plusinfo" do
    assert_difference('Plusinfo.count') do
      post plusinfos_url, params: { plusinfo: { etude: @plusinfo.etude, experience: @plusinfo.experience, formation: @plusinfo.formation } }, as: :json
    end

    assert_response 201
  end

  test "should show plusinfo" do
    get plusinfo_url(@plusinfo), as: :json
    assert_response :success
  end

  test "should update plusinfo" do
    patch plusinfo_url(@plusinfo), params: { plusinfo: { etude: @plusinfo.etude, experience: @plusinfo.experience, formation: @plusinfo.formation } }, as: :json
    assert_response 200
  end

  test "should destroy plusinfo" do
    assert_difference('Plusinfo.count', -1) do
      delete plusinfo_url(@plusinfo), as: :json
    end

    assert_response 204
  end
end
