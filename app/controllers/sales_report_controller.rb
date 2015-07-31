class SalesReportController < ApplicationController
  before_action :authenticate_usuario!
  def show
    @sells = Sell.where(usuario_id: current_usuario.id)
  end
end
