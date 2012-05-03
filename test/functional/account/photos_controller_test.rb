require 'test_helper'

class Account::PhotosControllerTest < ActionController::TestCase
  setup do
    @account_photo = account_photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:account_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account_photo" do
    assert_difference('Account::Photo.count') do
      post :create, account_photo: { description: @account_photo.description, title: @account_photo.title }
    end

    assert_redirected_to account_photo_path(assigns(:account_photo))
  end

  test "should show account_photo" do
    get :show, id: @account_photo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account_photo
    assert_response :success
  end

  test "should update account_photo" do
    put :update, id: @account_photo, account_photo: { description: @account_photo.description, title: @account_photo.title }
    assert_redirected_to account_photo_path(assigns(:account_photo))
  end

  test "should destroy account_photo" do
    assert_difference('Account::Photo.count', -1) do
      delete :destroy, id: @account_photo
    end

    assert_redirected_to account_photos_path
  end
end
