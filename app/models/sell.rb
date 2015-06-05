class Sell < ActiveRecord::Base
  belongs_to :usuario
  has_one :customer
  after_create :set_estado

  private

  def set_estado
    self.estado = true
  end

end
