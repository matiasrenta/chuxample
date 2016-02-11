require 'test_helper'

class KeyMetaTitlesControllerTest < ActionController::TestCase
  setup do
    @key_meta_title = key_meta_titles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:key_meta_titles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create key_meta_title" do
    assert_difference('KeyMetaTitle.count') do
      post :create, key_meta_title: { abbreviation: @key_meta_title.abbreviation, key_meta_subcategory_id: @key_meta_title.key_meta_subcategory_id, name: @key_meta_title.name }
    end

    assert_redirected_to key_meta_title_path(assigns(:key_meta_title))
  end

  test "should show key_meta_title" do
    get :show, id: @key_meta_title
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @key_meta_title
    assert_response :success
  end

  test "should update key_meta_title" do
    patch :update, id: @key_meta_title, key_meta_title: { abbreviation: @key_meta_title.abbreviation, key_meta_subcategory_id: @key_meta_title.key_meta_subcategory_id, name: @key_meta_title.name }
    assert_redirected_to key_meta_title_path(assigns(:key_meta_title))
  end

  test "should destroy key_meta_title" do
    assert_difference('KeyMetaTitle.count', -1) do
      delete :destroy, id: @key_meta_title
    end

    assert_redirected_to key_meta_titles_path
  end
end
