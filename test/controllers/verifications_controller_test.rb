require 'test_helper'

class VerificationsControllerTest < ActionController::TestCase
  setup do
    @verification = verifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:verifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create verification" do
    assert_difference('Verification.count') do
      post :create, verification: { comments: @verification.comments, evaluation: @verification.evaluation, project_activity_obra_id: @verification.project_activity_obra_id, question: @verification.question, status: @verification.status, user_id: @verification.user_id }
    end

    assert_redirected_to verification_path(assigns(:verification))
  end

  test "should show verification" do
    get :show, id: @verification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @verification
    assert_response :success
  end

  test "should update verification" do
    patch :update, id: @verification, verification: { comments: @verification.comments, evaluation: @verification.evaluation, project_activity_obra_id: @verification.project_activity_obra_id, question: @verification.question, status: @verification.status, user_id: @verification.user_id }
    assert_redirected_to verification_path(assigns(:verification))
  end

  test "should destroy verification" do
    assert_difference('Verification.count', -1) do
      delete :destroy, id: @verification
    end

    assert_redirected_to verifications_path
  end
end
