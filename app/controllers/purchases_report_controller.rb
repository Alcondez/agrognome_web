class PurchasesReportController < ApplicationController
  before_action :authenticate_usuario!
  def show
    @buys = Buy.where(usuario_id: current_usuario.id)
  end
end
