class DonantesCondicion < ApplicationRecord
  belongs_to :donante
  belongs_to :condicion_cronica

  self.table_name = "donantes_condiciones"
end
