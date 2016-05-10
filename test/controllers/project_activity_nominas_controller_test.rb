require 'test_helper'

class ProjectActivityNominasControllerTest < ActionController::TestCase
  setup do
    @project_activity_nomina = project_activity_nominas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_activity_nominas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_activity_nomina" do
    assert_difference('ProjectActivityNomina.count') do
      post :create, project_activity_nomina: { ascription_id: @project_activity_nomina.ascription_id, comentarios: @project_activity_nomina.comentarios, mes: @project_activity_nomina.mes, nro_trabajadores: @project_activity_nomina.nro_trabajadores, project_nomina_id: @project_activity_nomina.project_nomina_id }
    end

    assert_redirected_to project_activity_nomina_path(assigns(:project_activity_nomina))
  end

  test "should show project_activity_nomina" do
    get :show, id: @project_activity_nomina
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_activity_nomina
    assert_response :success
  end

  test "should update project_activity_nomina" do
    patch :update, id: @project_activity_nomina, project_activity_nomina: { ascription_id: @project_activity_nomina.ascription_id, comentarios: @project_activity_nomina.comentarios, mes: @project_activity_nomina.mes, nro_trabajadores: @project_activity_nomina.nro_trabajadores, project_nomina_id: @project_activity_nomina.project_nomina_id }
    assert_redirected_to project_activity_nomina_path(assigns(:project_activity_nomina))
  end

  test "should destroy project_activity_nomina" do
    assert_difference('ProjectActivityNomina.count', -1) do
      delete :destroy, id: @project_activity_nomina
    end

    assert_redirected_to project_activity_nominas_path
  end
end
