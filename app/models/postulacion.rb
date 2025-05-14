class Postulacion < ApplicationRecord
  #relaciones
  belongs_to :usuario
  belongs_to :solicitud
  belongs_to :ubicacion
end
