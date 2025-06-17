class Ubicacion < ApplicationRecord
  self.table_name = "ubicaciones"

  # relaciones
  has_many :solicitudes
  has_many :postulaciones
  belongs_to :user
  has_many :horarios
end
