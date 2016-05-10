require 'test_helper'

class PaysheetsControllerTest < ActionController::TestCase
  setup do
    @paysheet = paysheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paysheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paysheet" do
    assert_difference('Paysheet.count') do
      post :create, paysheet: { ascription_id: @paysheet.ascription_id, importe: @paysheet.importe, job_title_id: @paysheet.job_title_id, project_activity_nomina_id: @paysheet.project_activity_nomina_id, staff_id: @paysheet.staff_id }
    end

    assert_redirected_to paysheet_path(assigns(:paysheet))
  end

  test "should show paysheet" do
    get :show, id: @paysheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paysheet
    assert_response :success
  end

  test "should update paysheet" do
    patch :update, id: @paysheet, paysheet: { ascription_id: @paysheet.ascription_id, importe: @paysheet.importe, job_title_id: @paysheet.job_title_id, project_activity_nomina_id: @paysheet.project_activity_nomina_id, staff_id: @paysheet.staff_id }
    assert_redirected_to paysheet_path(assigns(:paysheet))
  end

  test "should destroy paysheet" do
    assert_difference('Paysheet.count', -1) do
      delete :destroy, id: @paysheet
    end

    assert_redirected_to paysheets_path
  end
end
