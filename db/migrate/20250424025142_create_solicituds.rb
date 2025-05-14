class CreateSolicituds < ActiveRecord::Migration[7.2]
  def change
    create_table :solicituds do |t|
      t.integer :user_id
      t.string :nombre_paciente
      t.string :cin_paciente
      t.string :tipo_sangre
      t.integer :location_id
      t.integer :donantes_requeridos
      t.text :detalles
      t.string :estado

      t.timestamps
    end
  end
end
