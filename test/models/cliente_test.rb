require 'test_helper'

class ClienteTest < ActiveSupport::TestCase
  def new_empty_client
    Cliente.new
  end

  test 'blank Cliente must be invalid' do
    @cli = new_empty_client

    assert @cli.invalid?
    assert @cli.errors[:nome].any?
    assert @cli.errors[:sobrenome].any?
  end

  test 'nome must have more than two characters' do
    @cli = new_empty_client

    @cli.nome = 'DJ'
    assert @cli.invalid?
    assert @cli.errors[:nome].any?

    @cli.nome = 'Joe'
    @cli.sobrenome = 'Max'

    assert @cli.valid?
  end

  test 'sobrenome must have more than two characters' do
    @cli = new_empty_client

    @cli.sobrenome = 'DJ'
    assert @cli.invalid?
    assert @cli.errors[:sobrenome].any?

    @cli.nome = 'Joe'
    @cli.sobrenome = 'Max'

    assert @cli.valid?
  end
end
