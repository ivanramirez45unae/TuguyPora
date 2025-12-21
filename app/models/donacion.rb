class Donacion < ApplicationRecord
  # Relaciones
  belongs_to :user
  belongs_to :solicitud, optional: true
  belongs_to :ubicacion
  belongs_to :donante
  belongs_to :postulacion

  # Validaciones de Integridad
  validates :postulacion_id, uniqueness: { message: "ya tiene una donación registrada" }
  validates :volumen_ml, presence: true, numericality: { greater_than: 0 }
  validates :tipo_sangre, presence: true
  validates :fecha_donacion, presence: true

  # Tu validación personalizada (Correcta)
  validate :fecha_no_futura

  # TRUCO PRO: Actualizar automáticamente la fecha del donante al guardar la donación
  after_create :actualizar_ultima_donacion_del_donante

  private

  def fecha_no_futura
    if fecha_donacion.present? && fecha_donacion > Date.today
      errors.add(:fecha_donacion, "no puede ser una fecha futura")
    end
  end

  def actualizar_ultima_donacion_del_donante
    # Esto evita que el médico tenga que ir al perfil del donante a cambiar la fecha a mano
    donante.update(ult_donacion_fecha: fecha_donacion)
  end
end
