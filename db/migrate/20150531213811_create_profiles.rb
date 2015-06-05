class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :usuario, index: true, foreign_key: true
      t.string :nombre
      t.text :direccion
      t.string :email
      t.string :telefono
      t.float :bsf_por_kg

      t.timestamps null: false
    end
  end
end
