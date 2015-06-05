class CreateSells < ActiveRecord::Migration
  def change
    create_table :sells do |t|
      t.references :usuario, index: true, foreign_key: true
      t.date :fecha_compra
      t.float :peso_final
      t.float :monto
      t.boolean :estado
      t.integer :cantidad

      t.timestamps null: false
    end
  end
end
