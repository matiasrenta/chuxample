require 'test_helper'

class KeyMetaSubcategoriesControllerTest < ActionController::TestCase
  setup do
    @key_meta_subcategory = key_meta_subcategories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:key_meta_subcategories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create key_meta_subcategory" do
    assert_difference('KeyMetaSubcategory.count') do
      post :create, key_meta_subcategory: { key_meta_category_id: @key_meta_subcategory.key_meta_category_id, name: @key_meta_subcategory.name }
    end

    assert_redirected_to key_meta_subcategory_path(assigns(:key_meta_subcategory))
  end

  test "should show key_meta_subcategory" do
    get :show, id: @key_meta_subcategory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @key_meta_subcategory
    assert_response :success
  end

  test "should update key_meta_subcategory" do
    patch :update, id: @key_meta_subcategory, key_meta_subcategory: { key_meta_category_id: @key_meta_subcategory.key_meta_category_id, name: @key_meta_subcategory.name }
    assert_redirected_to key_meta_subcategory_path(assigns(:key_meta_subcategory))
  end

  test "should destroy key_meta_subcategory" do
    assert_difference('KeyMetaSubcategory.count', -1) do
      delete :destroy, id: @key_meta_subcategory
    end

    assert_redirected_to key_meta_subcategories_path
  end
end
