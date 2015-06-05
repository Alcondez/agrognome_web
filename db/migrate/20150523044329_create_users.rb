class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.date :fecha_registro
      t.string :password
      t.string :username
      t.integer :id_user

      t.timestamps
    end
  end
end
