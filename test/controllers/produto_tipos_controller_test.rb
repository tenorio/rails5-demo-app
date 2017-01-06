require 'test_helper'

class ProdutoTiposControllerTest < ActionDispatch::IntegrationTest
  setup do
    @produto_tipo = produto_tipos(:one)

    @produto_tipo_create = { nome: @produto_tipo.nome, descricao: @produto_tipo.descricao }

    @produto_tipo2 = produto_tipos(:two)

    @produto_tipo_update = { nome: @produto_tipo2.nome, descricao: @produto_tipo2.descricao }
  end

  test "should get index" do
    get produto_tipos_url
    assert_response :success
  end

  test "should get new" do
    get new_produto_tipo_url
    assert_response :success
  end

  test "should create produto_tipo" do
    assert_difference('ProdutoTipo.count') do
      post produto_tipos_url, params: { produto_tipo: @produto_tipo_create }
    end

    assert_redirected_to produto_tipo_url(ProdutoTipo.last)
  end

  test "should show produto_tipo" do
    get produto_tipo_url(@produto_tipo)
    assert_response :success
  end

  test "should get edit" do
    get edit_produto_tipo_url(@produto_tipo)
    assert_response :success
  end

  test "should update produto_tipo" do
    patch produto_tipo_url(@produto_tipo), params: { produto_tipo: @produto_tipo_update }
    assert_redirected_to produto_tipo_url(@produto_tipo)
  end

  test "should destroy produto_tipo" do
    assert_difference('ProdutoTipo.count', -1) do
      delete produto_tipo_url(@produto_tipo)
    end

    assert_redirected_to produto_tipos_url
  end
end
