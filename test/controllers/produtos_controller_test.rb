require 'test_helper'

class ProdutosControllerTest < ActionDispatch::IntegrationTest
  setup do
    autenticar

    @produto = produtos(:one)
    @produto_params_create = { nome: @produto.nome, descricao: @produto.descricao, valor: @produto.valor,
                               estoque: @produto.estoque, tipo_id: tipos(:pecas).id }

    @produto2 = produtos(:two)
    @produto_params_update = { nome: @produto2.nome, descricao: @produto2.descricao, valor: @produto2.valor,
                                estoque: @produto2.estoque, tipo_id: tipos(:alimentos).id }
  end

  test "should get index" do
    get produtos_url
    assert_response :success
  end

  test "should get new" do
    get new_produto_url
    assert_response :success
  end

  test "should create produto" do
    assert_difference('Produto.count') do
      post produtos_url, params: { produto: @produto_params_create }
    end

    assert_redirected_to produto_url(Produto.last)
  end

  test "should show produto" do
    get produto_url(@produto)
    assert_response :success
  end

  test "should get edit" do
    get edit_produto_url(@produto)
    assert_response :success
  end

  test "should update produto" do
    patch produto_url(@produto), params: { produto: @produto_params_create }
    assert_redirected_to produto_url(@produto)
  end

  test "should destroy produto" do
    assert_difference('Produto.count', -1) do
      delete produto_url(@produto)
    end

    assert_redirected_to produtos_url
  end
end
