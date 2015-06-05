class ChangeFloatToReal < ActiveRecord::Migration
  def change
    execute "ALTER TABLE buys ALTER COLUMN monto SET DATA TYPE real"
  end
end
