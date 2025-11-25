class ChangeTipoSangreToText < ActiveRecord::Migration[7.2]
  def change
    change_column :solicitudes, :tipo_sangre, :text
  end
end
