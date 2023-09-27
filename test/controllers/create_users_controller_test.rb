require 'test_helper'

class CreateUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @create_user = create_users(:one)
  end

  test 'should get index' do
    get create_users_url
    assert_response :success
  end

  test 'should get new' do
    get new_create_user_url
    assert_response :success
  end

  test 'should create create_user' do
    assert_difference('CreateUser.count') do
      post create_users_url,
           params: { create_user: { bio: @create_user.bio, name: @create_user.name, photo: @create_user.photo,
                                    posts_counter: @create_user.posts_counter } }
    end

    assert_redirected_to create_user_url(CreateUser.last)
  end

  test 'should show create_user' do
    get create_user_url(@create_user)
    assert_response :success
  end

  test 'should get edit' do
    get edit_create_user_url(@create_user)
    assert_response :success
  end

  test 'should update create_user' do
    patch create_user_url(@create_user),
          params: { create_user: { bio: @create_user.bio, name: @create_user.name, photo: @create_user.photo,
                                   posts_counter: @create_user.posts_counter } }
    assert_redirected_to create_user_url(@create_user)
  end

  test 'should destroy create_user' do
    assert_difference('CreateUser.count', -1) do
      delete create_user_url(@create_user)
    end

    assert_redirected_to create_users_url
  end
end
