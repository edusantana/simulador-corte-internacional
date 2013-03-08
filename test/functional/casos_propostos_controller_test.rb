require 'test_helper'

class CasosPropostosControllerTest < ActionController::TestCase
  setup do
    @caso_proposto = casos_propostos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:casos_propostos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create caso_proposto" do
    assert_difference('CasoProposto.count') do
      post :create, caso_proposto: { assunto: @caso_proposto.assunto, descricao: @caso_proposto.descricao, nome: @caso_proposto.nome }
    end

    assert_redirected_to caso_proposto_path(assigns(:caso_proposto))
  end

  test "should show caso_proposto" do
    get :show, id: @caso_proposto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @caso_proposto
    assert_response :success
  end

  test "should update caso_proposto" do
    put :update, id: @caso_proposto, caso_proposto: { assunto: @caso_proposto.assunto, descricao: @caso_proposto.descricao, nome: @caso_proposto.nome }
    assert_redirected_to caso_proposto_path(assigns(:caso_proposto))
  end

  test "should destroy caso_proposto" do
    assert_difference('CasoProposto.count', -1) do
      delete :destroy, id: @caso_proposto
    end

    assert_redirected_to casos_propostos_path
  end
end
