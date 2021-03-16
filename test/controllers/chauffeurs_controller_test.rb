require 'test_helper'

class ChauffeursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chauffeur = chauffeurs(:one)
  end

  test "should get index" do
    get chauffeurs_url, as: :json
    assert_response :success
  end

  test "should create chauffeur" do
    assert_difference('Chauffeur.count') do
      post chauffeurs_url, params: { chauffeur: { contact1: @chauffeur.contact1, nom: @chauffeur.nom, prenom: @chauffeur.prenom } }, as: :json
    end

    assert_response 201
  end

  test "should show chauffeur" do
    get chauffeur_url(@chauffeur), as: :json
    assert_response :success
  end

  test "should update chauffeur" do
    patch chauffeur_url(@chauffeur), params: { chauffeur: { contact1: @chauffeur.contact1, nom: @chauffeur.nom, prenom: @chauffeur.prenom } }, as: :json
    assert_response 200
  end

  test "should destroy chauffeur" do
    assert_difference('Chauffeur.count', -1) do
      delete chauffeur_url(@chauffeur), as: :json
    end

    assert_response 204
  end
end
