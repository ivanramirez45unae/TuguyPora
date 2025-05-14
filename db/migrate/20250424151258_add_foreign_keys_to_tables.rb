class AddForeignKeysToTables < ActiveRecord::Migration[7.2]
  def change
    add_foreign_key :donantes, :users, column: :user_id
    add_foreign_key :donantes_condiciones, :donantes, column: :donor_id
    add_foreign_key :donantes_condiciones, :condiciones_cronicas, column: :condition_id
    add_foreign_key :donantes_medicamentos, :donantes, column: :donor_id
    add_foreign_key :donantes_medicamentos, :medicamentos, column: :medication_id
    add_foreign_key :solicitudes, :users, column: :user_id
    add_foreign_key :solicitudes, :ubicaciones, column: :location_id
    add_foreign_key :postulaciones, :users, column: :user_id
    add_foreign_key :postulaciones, :solicitudes, column: :request_id
    add_foreign_key :postulaciones, :ubicaciones, column: :location_id
    add_foreign_key :donaciones, :users, column: :user_id
    add_foreign_key :donaciones, :donantes, column: :donor_id
    add_foreign_key :donaciones, :solicitudes, column: :request_id
    add_foreign_key :donaciones, :ubicaciones, column: :location_id
    add_foreign_key :donaciones, :users, column: :verificado_por_usuario
    add_foreign_key :horarios, :ubicaciones, column: :location_id
    add_foreign_key :horarios, :dias, column: :day_id
  end
end
