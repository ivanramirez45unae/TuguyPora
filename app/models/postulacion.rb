class Postulacion < ApplicationRecord
  belongs_to :user
  belongs_to :solicitud, optional: true
  belongs_to :ubicacion
  has_one :donacion

  before_validation :set_default_estado, on: :create

  # Método de clase para vencer postulaciones pendientes
  def self.vencer_postulaciones!
    where(estado: "P")
      .where("fecha_tentativa < ?", Date.today - 7.days)
      .update_all(estado: "V")
  end

  private

  def set_default_estado
    self.estado ||= "P"
  end
end
