require 'test_helper'

class BuysControllerTest < ActionController::TestCase
  setup do
    @buy = buys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:buys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create buy" do
    assert_difference('Buy.count') do
      post :create, buy: { : @buy., belongs_to: @buy.belongs_to, estado: @buy.estado, fecha_compra: @buy.fecha_compra, id_compra: @buy.id_compra, id_proveedor: @buy.id_proveedor, monto: @buy.monto, peso_compra: @buy.peso_compra, unidad: @buy.unidad }
    end

    assert_redirected_to buy_path(assigns(:buy))
  end

  test "should show buy" do
    get :show, id: @buy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @buy
    assert_response :success
  end

  test "should update buy" do
    patch :update, id: @buy, buy: { : @buy., belongs_to: @buy.belongs_to, estado: @buy.estado, fecha_compra: @buy.fecha_compra, id_compra: @buy.id_compra, id_proveedor: @buy.id_proveedor, monto: @buy.monto, peso_compra: @buy.peso_compra, unidad: @buy.unidad }
    assert_redirected_to buy_path(assigns(:buy))
  end

  test "should destroy buy" do
    assert_difference('Buy.count', -1) do
      delete :destroy, id: @buy
    end

    assert_redirected_to buys_path
  end
end
