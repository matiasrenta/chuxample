require 'test_helper'

class KeyMetaValuesControllerTest < ActionController::TestCase
  setup do
    @key_meta_value = key_meta_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:key_meta_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create key_meta_value" do
    assert_difference('KeyMetaValue.count') do
      post :create, key_meta_value: { key_description: @key_meta_value.key_description, key_meta_title_id: @key_meta_value.key_meta_title_id, key_value: @key_meta_value.key_value }
    end

    assert_redirected_to key_meta_value_path(assigns(:key_meta_value))
  end

  test "should show key_meta_value" do
    get :show, id: @key_meta_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @key_meta_value
    assert_response :success
  end

  test "should update key_meta_value" do
    patch :update, id: @key_meta_value, key_meta_value: { key_description: @key_meta_value.key_description, key_meta_title_id: @key_meta_value.key_meta_title_id, key_value: @key_meta_value.key_value }
    assert_redirected_to key_meta_value_path(assigns(:key_meta_value))
  end

  test "should destroy key_meta_value" do
    assert_difference('KeyMetaValue.count', -1) do
      delete :destroy, id: @key_meta_value
    end

    assert_redirected_to key_meta_values_path
  end
end
