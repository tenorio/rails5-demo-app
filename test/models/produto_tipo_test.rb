require 'test_helper'

class ProdutoTipoTest < ActiveSupport::TestCase
  test 'ProdutoTipo attribute cant be empty' do
    @prod = ProdutoTipo.new

    assert @prod.invalid?
    assert @prod.errors[:nome].any?
  end

  test 'ProdutoTipo nome must be valid' do
    @prod = ProdutoTipo.new

    @prod.nome = 'fo'

    assert @prod.invalid?
    assert_equal ['é muito curto (mínimo: 3 caracteres)'], @prod.errors[:nome]

    @prod.nome = 'foo'

    assert @prod.valid?
  end
end
