class CreatePaddocks < ActiveRecord::Migration
  def change
    create_table :paddocks do |t|
      t.references :usuario, index: true, foreign_key: true
      t.string :nombre_potrero
      t.text :info_extra
      t.integer :max_cap
      t.integer :capacidad_actual

      t.timestamps null: false
    end
  end
end
