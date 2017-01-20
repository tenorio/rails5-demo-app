require 'test_helper'

class ClientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    autenticar

    @cliente = clientes(:einstein)

    @cliente_params_create = { nome: @cliente.nome, sobrenome: @cliente.sobrenome, endereco: @cliente.endereco,
                               sexo: @cliente.sexo, email: @cliente.email, uf: @cliente.uf, cidade: @cliente.cidade,
                               pais: @cliente.pais, cep: @cliente.cep, data_nascimento: @cliente.data_nascimento,
                               newsletter: @cliente.newsletter }

    @cliente = clientes(:bill)

    @cliente_params_update = { nome: @cliente.nome, sobrenome: @cliente.sobrenome, endereco: @cliente.endereco,
                               sexo: @cliente.sexo, email: @cliente.email, uf: @cliente.uf, cidade: @cliente.cidade,
                               pais: @cliente.pais, cep: @cliente.cep, data_nascimento: @cliente.data_nascimento,
                               newsletter: @cliente.newsletter }
  end

  teardown do
    get logout_path
  end

  test 'should get index' do
    get clientes_url
    assert_response :success
  end

  test 'should get new' do
    get new_cliente_url
    assert_response :success
  end

  test 'should create cliente' do
    assert_difference('Cliente.count') do
      post clientes_url, params: { cliente: @cliente_params_create }
    end

    assert_redirected_to cliente_url(Cliente.last)
  end

  test 'should show cliente' do
    get cliente_url(@cliente)
    assert_response :success
  end

  test 'should get edit' do
    get edit_cliente_url(@cliente)
    assert_response :success
  end

  test 'should update cliente' do
    patch cliente_url(@cliente), params: { cliente: @cliente_params_update }
    assert_redirected_to cliente_url(@cliente)
  end

  test 'should destroy cliente' do
    assert_difference('Cliente.count', -1) do
      delete cliente_url(@cliente)
    end

    assert_redirected_to clientes_url
  end

  def autenticar
    get login_path
    post sessions_path, params: { session: { email: 'linus@linux.com', password: '76a5%*&$#$ASD' } }
  end
end
