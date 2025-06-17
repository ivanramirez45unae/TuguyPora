class Donacion < ApplicationRecord
    # relaciones
    belongs_to :user
    belongs_to :solicitud, optional: true
    belongs_to :ubicacion
    belongs_to :donante
    belongs_to :postulacion
    validates :postulacion_id, uniqueness: true
    accepts_nested_attributes_for :donante
end
