require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'User must enter a password' do
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
end
