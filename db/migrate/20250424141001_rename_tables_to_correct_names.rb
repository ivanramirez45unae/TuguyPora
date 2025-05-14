class RenameTablesToCorrectNames < ActiveRecord::Migration[7.2]
  def change
    rename_table :solicituds, :solicitudes
    rename_table :postulacions, :postulaciones
    rename_table :donacions, :donaciones
  end
end

