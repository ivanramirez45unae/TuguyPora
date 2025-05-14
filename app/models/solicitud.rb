class Solicitud < ApplicationRecord
  #relaciones
  belongs_to :usuario
  belongs_to :ubicacion
  has_many :postulaciones
end
