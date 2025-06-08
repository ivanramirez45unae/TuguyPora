class AddDefaultToEstadoInPostulaciones < ActiveRecord::Migration[7.2]
  def change
    change_column_default :postulaciones, :estado, "P"
  end
end
