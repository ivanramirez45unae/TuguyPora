class RenameDonorIdInDonantesMedicamentos < ActiveRecord::Migration[7.2]
  def change
    rename_column :donantes_medicamentos, :donor_id, :donante_id
    rename_column :donantes_medicamentos, :medication_id, :medicamento_id
  end
end
