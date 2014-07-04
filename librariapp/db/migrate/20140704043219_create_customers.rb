class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :nombreCliente
      t.string :telefono
      t.string :direccion
      t.string :RFC
      t.string :correo
      t.string :facebook
      t.string :linkedln

      t.timestamps
    end
  end
end
