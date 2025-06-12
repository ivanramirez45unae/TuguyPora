class RenameRequestAndLocationInPostulaciones < ActiveRecord::Migration[6.1] # o tu versión actual
  def change
    rename_column :postulaciones, :request_id, :solicitud_id
    rename_column :postulaciones, :location_id, :ubicacion_id
  end
end
