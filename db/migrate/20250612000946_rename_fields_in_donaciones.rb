class RenameFieldsInDonaciones < ActiveRecord::Migration[6.1] # o la versión que estés usando
  def change
    rename_column :donaciones, :donor_id, :donante_id
    rename_column :donaciones, :request_id, :solicitud_id
    rename_column :donaciones, :location_id, :ubicacion_id
  end
end
