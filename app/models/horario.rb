class Horario < ApplicationRecord
  # relaciones
  belongs_to :ubicacion
  belongs_to :dia
end
