class Postulacion < ApplicationRecord
  # relaciones
  belongs_to :user
  belongs_to :solicitud
  belongs_to :ubicacion
end
