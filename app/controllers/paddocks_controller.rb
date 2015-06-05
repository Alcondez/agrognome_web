class PaddocksController < ApplicationController
  before_action :set_paddock, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!
  # GET /paddocks
  # GET /paddocks.json
  def index
    @paddocks = Paddock.where(usuario_id:current_usuario.id)
  end

  # GET /paddocks/1
  # GET /paddocks/1.json
  def show
  end

  # GET /paddocks/new
  def new
    @paddock = Paddock.new
  end

  # GET /paddocks/1/edit
  def edit
  end

  # POST /paddocks
  # POST /paddocks.json
  def create
    @paddock = current_usuario.paddocks.new(paddock_params)

    respond_to do |format|
      if @paddock.save
        format.html { redirect_to @paddock, notice: 'El potrero ha sido creado correctamente' }
        format.json { render :show, status: :created, location: @paddock }
      else
        format.html { render :new }
        format.json { render json: @paddock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paddocks/1
  # PATCH/PUT /paddocks/1.json
  def update
    respond_to do |format|
      if @paddock.update(paddock_params)
        format.html { redirect_to @paddock, notice: 'El potrero ha sido actualizado correctamente' }
        format.json { render :show, status: :ok, location: @paddock }
      else
        format.html { render :edit }
        format.json { render json: usuario_buys_path(current_usuario.id), status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paddocks/1
  # DELETE /paddocks/1.json
  def destroy
    @paddock.destroy
    respond_to do |format|
      format.html { redirect_to usuario_buys_path(current_usuario.id), notice: 'El potrero ha sido eliminado correctamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paddock
      @paddock = Paddock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paddock_params
      params.require(:paddock).permit(:usuario_id, :nombre_potrero, :info_extra, :max_cap, :capacidad_actual)
    end
end
