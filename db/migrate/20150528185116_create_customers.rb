class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.references :usuario, index: true, foreign_key: true
      t.references :sell, index: true, foreign_key: true
      t.string :nombre_cliente
      t.string :documento_fiscal
      t.string :telefono
      t.text :direccion
      t.string :email
      t.boolean :estado

      t.timestamps null: false
    end
  end
end
