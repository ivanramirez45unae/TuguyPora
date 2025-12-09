class AddActivoToUbicaciones < ActiveRecord::Migration[7.2]
  def change
    add_column :ubicaciones, :activo, :boolean, default: true
  end
end
