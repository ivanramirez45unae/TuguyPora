class Donante < ApplicationRecord
  # Relaciones
  has_many :donantes_medicamentos, dependent: :destroy
  has_many :medicamentos, through: :donantes_medicamentos

  has_many :donantes_condiciones, dependent: :destroy, class_name: "DonantesCondicion"
  has_many :condiciones_cronicas, through: :donantes_condiciones, source: :condicion_cronica

  belongs_to :user

  # Validaciones de integridad
  validates :user_id, uniqueness: true
  validates :tipo_sanguineo, presence: true
  validates :peso_kg, numericality: { greater_than: 0 }
  validates :estatura_cm, numericality: { greater_than: 0 }

  # Validación personalizada para la fecha
  validate :fecha_donacion_no_puede_ser_en_el_futuro

  def puede_donar?
    return true unless ult_donacion_fecha.present?

    # Manejo de seguridad por si user.genero es nil
    genero = user&.genero || "Masculino"
    meses_espera = genero == "Femenino" ? 4 : 3
    fecha_habilitada = ult_donacion_fecha.advance(months: meses_espera)
    Date.today >= fecha_habilitada
  end

  def fecha_habilitada_para_donar
    return Date.today unless ult_donacion_fecha.present?

    genero = user&.genero || "Masculino"
    meses_espera = genero == "Femenino" ? 4 : 3
    ult_donacion_fecha.advance(months: meses_espera)
  end

  private

  # Método de validación personalizada
  def fecha_donacion_no_puede_ser_en_el_futuro
    if ult_donacion_fecha.present? && ult_donacion_fecha > Date.today
      errors.add(:ult_donacion_fecha, "no puede ser una fecha futura")
    end
  end
end
