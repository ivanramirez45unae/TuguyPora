class RenameForeignKeysInHorarios < ActiveRecord::Migration[6.0]
  def change
    rename_column :horarios, :location_id, :ubicacion_id
    rename_column :horarios, :day_id, :dia_id
  end
end
