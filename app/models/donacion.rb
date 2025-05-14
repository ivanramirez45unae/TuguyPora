class Donacion < ApplicationRecord
    #relaciones
    belongs_to :usuario
    belongs_to :solicitud
    belongs_to :ubicacion
    belongs_to :donante
end
