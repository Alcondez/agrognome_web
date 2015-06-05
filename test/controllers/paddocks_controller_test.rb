require 'test_helper'

class PaddocksControllerTest < ActionController::TestCase
  setup do
    @paddock = paddocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paddocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paddock" do
    assert_difference('Paddock.count') do
      post :create, paddock: { capacidad_actual: @paddock.capacidad_actual, info_extra: @paddock.info_extra, max_cap: @paddock.max_cap, nombre_potrero: @paddock.nombre_potrero, usuario_id: @paddock.usuario_id }
    end

    assert_redirected_to paddock_path(assigns(:paddock))
  end

  test "should show paddock" do
    get :show, id: @paddock
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paddock
    assert_response :success
  end

  test "should update paddock" do
    patch :update, id: @paddock, paddock: { capacidad_actual: @paddock.capacidad_actual, info_extra: @paddock.info_extra, max_cap: @paddock.max_cap, nombre_potrero: @paddock.nombre_potrero, usuario_id: @paddock.usuario_id }
    assert_redirected_to paddock_path(assigns(:paddock))
  end

  test "should destroy paddock" do
    assert_difference('Paddock.count', -1) do
      delete :destroy, id: @paddock
    end

    assert_redirected_to paddocks_path
  end
end
