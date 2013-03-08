require 'test_helper'

class PropostasControllerTest < ActionController::TestCase
  setup do
    @proposta = propostas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:propostas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proposta" do
    assert_difference('Proposta.count') do
      post :create, proposta: { assunto: @proposta.assunto, descricao: @proposta.descricao, nome: @proposta.nome }
    end

    assert_redirected_to proposta_path(assigns(:proposta))
  end

  test "should show proposta" do
    get :show, id: @proposta
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proposta
    assert_response :success
  end

  test "should update proposta" do
    put :update, id: @proposta, proposta: { assunto: @proposta.assunto, descricao: @proposta.descricao, nome: @proposta.nome }
    assert_redirected_to proposta_path(assigns(:proposta))
  end

  test "should destroy proposta" do
    assert_difference('Proposta.count', -1) do
      delete :destroy, id: @proposta
    end

    assert_redirected_to propostas_path
  end
end
