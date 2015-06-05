class CreateBuys < ActiveRecord::Migration
  def change
    create_table :buys do |t|
      t.date :fecha_compra
      t.float :peso_compra
      t.float :monto
      t.boolean :estado
      t.integer :unidad
      t.integer :id_proveedor
      t.integer :id_compra

      t.timestamps
    end
  end
end
