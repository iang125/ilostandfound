require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { address1: @user.address1, address2: @user.address2, cell_number: @user.cell_number, cell_show: @user.cell_show, city: @user.city, email_show: @user.email_show, first_name: @user.first_name, home_phone: @user.home_phone, home_phone_show: @user.home_phone_show, last_name: @user.last_name, password_digest: @user.password_digest, postal: @user.postal, qrcode: @user.qrcode, state: @user.state }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { address1: @user.address1, address2: @user.address2, cell_number: @user.cell_number, cell_show: @user.cell_show, city: @user.city, email_show: @user.email_show, first_name: @user.first_name, home_phone: @user.home_phone, home_phone_show: @user.home_phone_show, last_name: @user.last_name, password_digest: @user.password_digest, postal: @user.postal, qrcode: @user.qrcode, state: @user.state }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
