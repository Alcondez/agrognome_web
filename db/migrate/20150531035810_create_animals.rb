class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.references :usuario, index: true, foreign_key: true
      t.references :paddock, index: true, foreign_key: true
      t.references :provider, index: true, foreign_key: true
      t.date :fecha_compra
      t.date :fecha_venta
      t.boolean :genero
      t.boolean :cria

      t.timestamps null: false
    end
  end
end
