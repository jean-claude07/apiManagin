require 'test_helper'

class CandidatprofilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @candidatprofile = candidatprofiles(:one)
  end

  test "should get index" do
    get candidatprofiles_url, as: :json
    assert_response :success
  end

  test "should create candidatprofile" do
    assert_difference('Candidatprofile.count') do
      post candidatprofiles_url, params: { candidatprofile: { email: @candidatprofile.email, nom: @candidatprofile.nom, password_digest: @candidatprofile.password_digest, prenom: @candidatprofile.prenom, string: @candidatprofile.string, telephone: @candidatprofile.telephone } }, as: :json
    end

    assert_response 201
  end

  test "should show candidatprofile" do
    get candidatprofile_url(@candidatprofile), as: :json
    assert_response :success
  end

  test "should update candidatprofile" do
    patch candidatprofile_url(@candidatprofile), params: { candidatprofile: { email: @candidatprofile.email, nom: @candidatprofile.nom, password_digest: @candidatprofile.password_digest, prenom: @candidatprofile.prenom, string: @candidatprofile.string, telephone: @candidatprofile.telephone } }, as: :json
    assert_response 200
  end

  test "should destroy candidatprofile" do
    assert_difference('Candidatprofile.count', -1) do
      delete candidatprofile_url(@candidatprofile), as: :json
    end

    assert_response 204
  end
end
