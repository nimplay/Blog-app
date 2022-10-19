require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get path
    assert_response :success
    assert_select '.user', 2
  end
  test 'should get create' do
    get user_path(users(:one))
    assert_response :success
    assert_select '.name', 'Pepe'
    assert_select '.bio', 'Heloooooo!!'
    assert_select '.post-count', 'Number posts: 1'
  end
end
