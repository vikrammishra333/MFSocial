require 'test_helper'

class Account::AlbumsControllerTest < ActionController::TestCase
  setup do
    @account_album = account_albums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:account_albums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account_album" do
    assert_difference('Account::Album.count') do
      post :create, account_album: { description: @account_album.description, title: @account_album.title, user_id: @account_album.user_id }
    end

    assert_redirected_to account_album_path(assigns(:account_album))
  end

  test "should show account_album" do
    get :show, id: @account_album
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account_album
    assert_response :success
  end

  test "should update account_album" do
    put :update, id: @account_album, account_album: { description: @account_album.description, title: @account_album.title, user_id: @account_album.user_id }
    assert_redirected_to account_album_path(assigns(:account_album))
  end

  test "should destroy account_album" do
    assert_difference('Account::Album.count', -1) do
      delete :destroy, id: @account_album
    end

    assert_redirected_to account_albums_path
  end
end
