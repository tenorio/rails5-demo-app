require 'test_helper'

class TipoTest < ActiveSupport::TestCase
  test 'blank data must be invalid' do
    @tipo = Tipo.new

    assert @tipo.invalid?
    assert @tipo.errors[:nome].any?
  end
end
