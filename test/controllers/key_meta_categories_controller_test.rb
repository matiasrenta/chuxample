require 'test_helper'

class KeyMetaCategoriesControllerTest < ActionController::TestCase
  setup do
    @key_meta_category = key_meta_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:key_meta_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create key_meta_category" do
    assert_difference('KeyMetaCategory.count') do
      post :create, key_meta_category: { name: @key_meta_category.name }
    end

    assert_redirected_to key_meta_category_path(assigns(:key_meta_category))
  end

  test "should show key_meta_category" do
    get :show, id: @key_meta_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @key_meta_category
    assert_response :success
  end

  test "should update key_meta_category" do
    patch :update, id: @key_meta_category, key_meta_category: { name: @key_meta_category.name }
    assert_redirected_to key_meta_category_path(assigns(:key_meta_category))
  end

  test "should destroy key_meta_category" do
    assert_difference('KeyMetaCategory.count', -1) do
      delete :destroy, id: @key_meta_category
    end

    assert_redirected_to key_meta_categories_path
  end
end
