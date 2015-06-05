class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.references :usuario, index: true, foreign_key: true
      t.references :buy, index: true, foreign_key: true
      t.string :nombre
      t.string :documento_fiscal
      t.string :telefono
      t.string :direccion
      t.string :email
      t.boolean :estado

      t.timestamps null: false
    end
  end
end
