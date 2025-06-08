class Postulacion < ApplicationRecord
  # relaciones
  belongs_to :user
  belongs_to :solicitud, optional: true
  belongs_to :ubicacion, class_name: "Ubicacion", foreign_key: "location_id"


  before_validation :set_default_estado, on: :create

  private

  def set_default_estado
    self.estado ||= "P"
  end
end
