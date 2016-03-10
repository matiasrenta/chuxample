require 'test_helper'

class CatGenGoalsControllerTest < ActionController::TestCase
  setup do
    @cat_gen_goal = cat_gen_goals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cat_gen_goals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cat_gen_goal" do
    assert_difference('CatGenGoal.count') do
      post :create, cat_gen_goal: { cat_gen_strategy_id: @cat_gen_goal.cat_gen_strategy_id, description: @cat_gen_goal.description, key: @cat_gen_goal.key }
    end

    assert_redirected_to cat_gen_goal_path(assigns(:cat_gen_goal))
  end

  test "should show cat_gen_goal" do
    get :show, id: @cat_gen_goal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cat_gen_goal
    assert_response :success
  end

  test "should update cat_gen_goal" do
    patch :update, id: @cat_gen_goal, cat_gen_goal: { cat_gen_strategy_id: @cat_gen_goal.cat_gen_strategy_id, description: @cat_gen_goal.description, key: @cat_gen_goal.key }
    assert_redirected_to cat_gen_goal_path(assigns(:cat_gen_goal))
  end

  test "should destroy cat_gen_goal" do
    assert_difference('CatGenGoal.count', -1) do
      delete :destroy, id: @cat_gen_goal
    end

    assert_redirected_to cat_gen_goals_path
  end
end
