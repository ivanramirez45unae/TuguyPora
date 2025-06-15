class Postulacion < ApplicationRecord
  # relaciones
  belongs_to :user
  belongs_to :solicitud, optional: true
  belongs_to :ubicacion
  has_one :donacion

  before_validation :set_default_estado, on: :create

  private

  def set_default_estado
    self.estado ||= "P"
  end
end
