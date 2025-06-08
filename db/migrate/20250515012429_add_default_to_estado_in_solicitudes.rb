class AddDefaultToEstadoInSolicitudes < ActiveRecord::Migration[7.2]
  def change
    change_column_default :solicitudes, :estado, "pendiente"
  end
end
