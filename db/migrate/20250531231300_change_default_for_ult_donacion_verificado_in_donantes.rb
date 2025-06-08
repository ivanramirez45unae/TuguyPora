class ChangeDefaultForUltDonacionVerificadoInDonantes < ActiveRecord::Migration[7.0]
  def change
    change_column_default :donantes, :ult_donacion_verificado, from: nil, to: false
  end
end
