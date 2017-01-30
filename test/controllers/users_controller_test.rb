require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    autenticar
  end

  test 'should get new' do
    get new_user_path
    assert_response :success
  end

  test 'should not create user without password confirmation' do
    assert_no_difference 'User.count' do
      post users_url, params: { user: { email: 'foo@internet.com',
                                        password: 'abc123',
                                        password_confirmation: 'abc1234'} }
    end
  end

  test 'should create user' do
    assert_difference('User.count') do
      post users_url, params: { user: { email: 'foo@internet.com',
                                        password: 'Idea2017',
                                        password_confirmation: 'Idea2017'} }
    end

    assert_redirected_to root_url
  end
end
