require 'test_helper'

class CatGenObjectivesControllerTest < ActionController::TestCase
  setup do
    @cat_gen_objective = cat_gen_objectives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cat_gen_objectives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cat_gen_objective" do
    assert_difference('CatGenObjective.count') do
      post :create, cat_gen_objective: { cat_gen_axi_id: @cat_gen_objective.cat_gen_axi_id, description: @cat_gen_objective.description, key: @cat_gen_objective.key }
    end

    assert_redirected_to cat_gen_objective_path(assigns(:cat_gen_objective))
  end

  test "should show cat_gen_objective" do
    get :show, id: @cat_gen_objective
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cat_gen_objective
    assert_response :success
  end

  test "should update cat_gen_objective" do
    patch :update, id: @cat_gen_objective, cat_gen_objective: { cat_gen_axi_id: @cat_gen_objective.cat_gen_axi_id, description: @cat_gen_objective.description, key: @cat_gen_objective.key }
    assert_redirected_to cat_gen_objective_path(assigns(:cat_gen_objective))
  end

  test "should destroy cat_gen_objective" do
    assert_difference('CatGenObjective.count', -1) do
      delete :destroy, id: @cat_gen_objective
    end

    assert_redirected_to cat_gen_objectives_path
  end
end
