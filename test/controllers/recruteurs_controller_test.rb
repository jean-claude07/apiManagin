require 'test_helper'

class RecruteursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recruteur = recruteurs(:one)
  end

  test "should get index" do
    get recruteurs_url, as: :json
    assert_response :success
  end

  test "should create recruteur" do
    assert_difference('Recruteur.count') do
      post recruteurs_url, params: { recruteur: { email: @recruteur.email, entreprise: @recruteur.entreprise, nom: @recruteur.nom, other: @recruteur.other, password_digest: @recruteur.password_digest, prenom: @recruteur.prenom, telephone: @recruteur.telephone } }, as: :json
    end

    assert_response 201
  end

  test "should show recruteur" do
    get recruteur_url(@recruteur), as: :json
    assert_response :success
  end

  test "should update recruteur" do
    patch recruteur_url(@recruteur), params: { recruteur: { email: @recruteur.email, entreprise: @recruteur.entreprise, nom: @recruteur.nom, other: @recruteur.other, password_digest: @recruteur.password_digest, prenom: @recruteur.prenom, telephone: @recruteur.telephone } }, as: :json
    assert_response 200
  end

  test "should destroy recruteur" do
    assert_difference('Recruteur.count', -1) do
      delete recruteur_url(@recruteur), as: :json
    end

    assert_response 204
  end
end
