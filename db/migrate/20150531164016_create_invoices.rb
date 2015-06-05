class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :usuario, index: true, foreign_key: true
      t.references :sell, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
      t.date :fecha_factura
      t.float :monto
      t.boolean :estado
      t.integer :cantidad
      t.string :nombre
      t.text :direccion
      t.string :telefono

      t.timestamps null: false
    end
  end
end
