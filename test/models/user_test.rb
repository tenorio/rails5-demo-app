require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'User password cant be empty' do
    @user = User.new

    assert @user.invalid?
    assert @user.errors[:password].any?
  end

  test 'E-mail must be unique' do
    @mail = users(:bill).email

    @user1 = User.create(:email => @mail, :password => users(:bill).password)

    @user2 = User.new(:email => @mail, :password => users(:linus).password)

    assert @user2.invalid?
    assert 'está em uso', @user2.errors[:email]
  end

  test 'should not be valid when a password is less than 6 characters' do
    @user = User.new(email: 'foo@internet.com', password: '12345', password_confirmation: '12345')

    assert @user.invalid?

    assert @user.errors[:password].any?
    assert 'é muito curto (mínimo: 6 caracteres)', @user.errors[:password]
  end
end
