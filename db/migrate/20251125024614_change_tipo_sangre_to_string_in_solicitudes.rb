class ChangeTipoSangreToStringInSolicitudes < ActiveRecord::Migration[7.0]
  def change
    change_column :solicitudes, :tipo_sangre, :string
  end
end
