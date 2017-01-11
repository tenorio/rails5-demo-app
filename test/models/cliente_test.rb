require 'test_helper'

class ClienteTest < ActiveSupport::TestCase
  test 'blank client data must be invalid' do
    @cli = Cliente.new

    assert @cli.invalid?
    assert @cli.errors[:nome].any?
    assert @cli.errors[:sobrenome].any?
    assert @cli.errors[:sexo].any?
  end

  test 'nome must have at least three characters' do
    @cli = clientes(:einstein)

    @cli.nome = 'DJ'
    assert @cli.invalid?
    assert @cli.errors[:nome].any?

    @cli.nome = 'Max'
    @cli.sobrenome = 'Steven'

    assert @cli.valid?
  end

  test 'sobrenome must have at least three characters' do
    @cli = clientes(:einstein)

    @cli.sobrenome = 'DJ'
    assert @cli.invalid?
    assert @cli.errors[:sobrenome].any?

    @cli.nome = 'Joe'
    @cli.sobrenome = 'Max'

    assert @cli.valid?
  end

  test 'sex can only be M or F' do
    @cli = clientes(:einstein)

    ('A'..'Z').each do |letter|
      @cli.sexo = letter

      case letter
        when 'M', 'F'
          assert @cli.valid?
          @cli.sexo = letter.downcase
          assert @cli.invalid?
        else
          assert @cli.invalid?
          @cli.sexo = letter.downcase
          assert @cli.invalid?
      end
    end
  end

  test 'UF must have exactly two characters' do
    @cli = clientes(:bill)

    @cli.uf = ''
    assert @cli.invalid?
    assert @cli.errors[:uf].any?

    @cli.uf = nil
    assert @cli.invalid?
    assert @cli.errors[:uf].any?

    @cli.uf = 'FOR'
    assert @cli.invalid?
    assert @cli.errors[:uf].any?

    @cli.uf = 547
    assert @cli.invalid?
    assert @cli.errors[:uf].any?

    @cli.uf = 'SP'
    assert @cli.valid?
  end

  test 'CEP must have exactly eight numeric characters' do
    @cli = clientes(:einstein)

    @cli.cep = ''
    assert @cli.invalid?
    assert @cli.errors[:cep].any?

    @cli.cep = nil
    assert @cli.invalid?
    assert @cli.errors[:cep].any?

    @cli.cep = 'FOR'
    assert @cli.invalid?
    assert @cli.errors[:cep].any?

    @cli.cep = 'FORMATBR'
    assert @cli.invalid?
    assert @cli.errors[:cep].any?

    @cli.cep = 547
    assert @cli.invalid?
    assert @cli.errors[:cep].any?

    @cli.cep = '05510145'
    assert @cli.valid?
  end
end
