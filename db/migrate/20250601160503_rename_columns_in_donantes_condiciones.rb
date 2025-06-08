class RenameColumnsInDonantesCondiciones < ActiveRecord::Migration[7.2]
  def change
    rename_column :donantes_condiciones, :donor_id, :donante_id
    rename_column :donantes_condiciones, :condition_id, :condicion_cronica_id
  end
end
