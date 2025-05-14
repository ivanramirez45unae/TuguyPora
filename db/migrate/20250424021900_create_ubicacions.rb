class CreateUbicacions < ActiveRecord::Migration[7.2]
  def change
    create_table :ubicacions do |t|
      t.string :nombre
      t.string :direccion
      t.string :num_telefono

      t.timestamps
    end
  end
end
