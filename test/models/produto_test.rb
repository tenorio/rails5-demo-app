require 'test_helper'

class ProdutoTest < ActiveSupport::TestCase
  def new_product
    Produto.new(nome: 'Tricoder', descricao: 'Brand new tricoder', valor: 500, estoque: 50)
  end

  test 'Produto attributes cant be empty' do
    @prod = Produto.new

    assert @prod.invalid?
    assert @prod.errors[:nome].any?
    assert @prod.errors[:descricao].any?
    assert @prod.errors[:valor].any?
    assert @prod.errors[:estoque].any?
  end

  test 'Produto valor must be valid' do
    @prod = new_product

    @prod.valor = ''

    assert @prod.invalid?
    assert_equal ['não é um número'], @prod.errors[:valor]

    @prod.valor = -1

    assert @prod.invalid?
    assert_equal ['deve ser maior que 0'], @prod.errors[:valor]

    @prod.valor = 0
    assert @prod.invalid?
    assert_equal ['deve ser maior que 0'], @prod.errors[:valor]

    @prod.valor = 0.1
    assert @prod.valid?
  end
end
