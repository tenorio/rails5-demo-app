require 'test_helper'

class ClienteTest < ActiveSupport::TestCase
  test 'should not save cliente without name or middle name' do
    c = Cliente.new

    assert_not c.save, 'Saved the cliente without name or middle name'
  end

  test 'should not save cliente without name' do
    c = Cliente.new

    c.sobrenome = 'Smith'

    assert_not c.save, 'Saved the cliente without name'
  end

  test 'should not save cliente with name containing less than three characters' do
    c = Cliente.new

    c.nome = 'DJ'

    assert_not c.save, 'Saved the cliente with name containing only two characters'
  end

  test 'should not save cliente without middle name' do
    c = Cliente.new

    c.nome = 'Andrew'

    assert_not c.save, 'Saved the cliente without middle name'
  end

  test 'should not save cliente with middle name containing less than three characters' do
    c = Cliente.new

    c.sobrenome = 'DJ'

    assert_not c.save, 'Saved the cliente with middle name containing only two characters'
  end
end
