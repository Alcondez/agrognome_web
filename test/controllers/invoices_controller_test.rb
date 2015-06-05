require 'test_helper'

class InvoicesControllerTest < ActionController::TestCase
  setup do
    @invoice = invoices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post :create, invoice: { cantidad: @invoice.cantidad, customer_id: @invoice.customer_id, direccion: @invoice.direccion, estado: @invoice.estado, fecha_factura: @invoice.fecha_factura, monto: @invoice.monto, nombre: @invoice.nombre, sell_id: @invoice.sell_id, telefono: @invoice.telefono, usuario_id: @invoice.usuario_id }
    end

    assert_redirected_to invoice_path(assigns(:invoice))
  end

  test "should show invoice" do
    get :show, id: @invoice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invoice
    assert_response :success
  end

  test "should update invoice" do
    patch :update, id: @invoice, invoice: { cantidad: @invoice.cantidad, customer_id: @invoice.customer_id, direccion: @invoice.direccion, estado: @invoice.estado, fecha_factura: @invoice.fecha_factura, monto: @invoice.monto, nombre: @invoice.nombre, sell_id: @invoice.sell_id, telefono: @invoice.telefono, usuario_id: @invoice.usuario_id }
    assert_redirected_to invoice_path(assigns(:invoice))
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete :destroy, id: @invoice
    end

    assert_redirected_to invoices_path
  end
end
