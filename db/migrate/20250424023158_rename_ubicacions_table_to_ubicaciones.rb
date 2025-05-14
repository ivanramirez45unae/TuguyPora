class RenameUbicacionsTableToUbicaciones < ActiveRecord::Migration[7.2]
  def change
    rename_table :ubicacions, :ubicaciones
  end
end
