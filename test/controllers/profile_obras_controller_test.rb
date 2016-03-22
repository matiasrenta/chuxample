require 'test_helper'

class ProfileObrasControllerTest < ActionController::TestCase
  setup do
    @profile_obra = profile_obras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profile_obras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile_obra" do
    assert_difference('ProfileObra.count') do
      post :create, profile_obra: { avance_programado: @profile_obra.avance_programado, avance_real: @profile_obra.avance_real, calle: @profile_obra.calle, cantidad: @profile_obra.cantidad, codigo_postal: @profile_obra.codigo_postal, colonia: @profile_obra.colonia, contrato: @profile_obra.contrato, fecha_fin: @profile_obra.fecha_fin, fecha_inicio: @profile_obra.fecha_inicio, importe: @profile_obra.importe, numero: @profile_obra.numero, tipo_obra: @profile_obra.tipo_obra }
    end

    assert_redirected_to profile_obra_path(assigns(:profile_obra))
  end

  test "should show profile_obra" do
    get :show, id: @profile_obra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile_obra
    assert_response :success
  end

  test "should update profile_obra" do
    patch :update, id: @profile_obra, profile_obra: { avance_programado: @profile_obra.avance_programado, avance_real: @profile_obra.avance_real, calle: @profile_obra.calle, cantidad: @profile_obra.cantidad, codigo_postal: @profile_obra.codigo_postal, colonia: @profile_obra.colonia, contrato: @profile_obra.contrato, fecha_fin: @profile_obra.fecha_fin, fecha_inicio: @profile_obra.fecha_inicio, importe: @profile_obra.importe, numero: @profile_obra.numero, tipo_obra: @profile_obra.tipo_obra }
    assert_redirected_to profile_obra_path(assigns(:profile_obra))
  end

  test "should destroy profile_obra" do
    assert_difference('ProfileObra.count', -1) do
      delete :destroy, id: @profile_obra
    end

    assert_redirected_to profile_obras_path
  end
end
