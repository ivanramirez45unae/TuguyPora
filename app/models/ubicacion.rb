class Ubicacion < ApplicationRecord
  #relaciones
  has_many :solicitudes
  has_many :postulaciones
end
