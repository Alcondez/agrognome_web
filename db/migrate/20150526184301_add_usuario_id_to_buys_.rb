class AddUsuarioIdToBuys < ActiveRecord::Migration
  def change
    add_reference :buys, :usuario, index: true
    add_foreign_key :buys, :usuarios
  end
end
