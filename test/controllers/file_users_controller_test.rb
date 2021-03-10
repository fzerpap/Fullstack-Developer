require 'test_helper'

class FileUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @file_user = file_users(:one)
  end

  test "should get index" do
    get file_users_url
    assert_response :success
  end

  test "should get new" do
    get new_file_user_url
    assert_response :success
  end

  test "should create file_user" do
    assert_difference('FileUser.count') do
      post file_users_url, params: { file_user: { name: @file_user.name } }
    end

    assert_redirected_to file_user_url(FileUser.last)
  end

  test "should show file_user" do
    get file_user_url(@file_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_file_user_url(@file_user)
    assert_response :success
  end

  test "should update file_user" do
    patch file_user_url(@file_user), params: { file_user: { name: @file_user.name } }
    assert_redirected_to file_user_url(@file_user)
  end

  test "should destroy file_user" do
    assert_difference('FileUser.count', -1) do
      delete file_user_url(@file_user)
    end

    assert_redirected_to file_users_url
  end
end
