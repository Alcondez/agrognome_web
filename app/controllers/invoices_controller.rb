class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!
  require 'prawn'
  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.where(usuario_id: current_usuario.id)
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @invoices = Invoice.where(usuario_id: current_usuario.id)
    respond_to do |format|
      format.html do
        render :show
      end
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "Fecha de la factura:  #{@invoices.last.fecha_factura}"
        pdf.text "Direccion:  #{@invoices.last.direccion}"
        pdf.text "Telefono:  #{@invoices.last.telefono}"
        pdf.text "A nombre de:  #{@invoices.last.nombre}"
        pdf.text "Factura con id #{@invoices.last.id}"
        pdf.text "Monto de la factura: #{@invoices.last.monto}"
        pdf.text "Cantidad:  #{@invoices.last.cantidad}"
        # Use whatever prawn methods you need on the pdf object to generate the PDF file right here.

        send_data pdf.render, type: "application/pdf", disposition: "inline"
        # send_data renders the pdf on the client side rather than saving it on the server filesystem.
        # Inline disposition renders it in the browser rather than making it a file download.
      end
    end
  end


  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = current_usuario.invoices.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'La factura ha sido creada con exito.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'La factura ha sido actualizada con exito.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'La factura ha sido eliminada con exito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:usuario_id, :sell_id, :customer_id, :fecha_factura, :monto, :estado, :cantidad, :nombre, :direccion, :telefono)
    end
end
