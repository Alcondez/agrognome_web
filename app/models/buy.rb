class Buy < ActiveRecord::Base
  belongs_to :usuario
  after_create :set_estado

  private

  def set_estado
    self.estado = true
  end

end
