class Donante < ApplicationRecord
  # Relaciones
  has_many :donantes_medicamentos, dependent: :destroy
  has_many :medicamentos, through: :donantes_medicamentos

  has_many :donantes_condiciones, dependent: :destroy, class_name: "DonantesCondicion"
  has_many :condiciones_cronicas, through: :donantes_condiciones, source: :condicion_cronica

  belongs_to :user

  # Validaciones básicas
  validates :user_id, uniqueness: true
  validates :tipo_sanguineo, presence: true
  validates :peso_kg, numericality: { greater_than_or_equal_to: 55, message: "debe ser al menos 55 kg" }
  validates :estatura_cm, numericality: { greater_than: 0 }

  # Validaciones personalizadas
  validate :edad_valida
  validate :no_tiene_impedimentos
  validate :fecha_donacion_no_puede_ser_en_el_futuro

# -----------------------------
# REGLA SIMPLE: BLOQUEO TOTAL
# -----------------------------
def no_tiene_impedimentos
  bloqueantes_condiciones = [
    "anemia crónica",
    "cáncer",
    "enfermedad cardíaca",
    "enfermedad renal crónica",
    "hepatitis b o c",
    "lupus/enfermedades autoinmunes",
    "vih/sida"
  ]

  bloqueantes_medicamentos = [
    "quimioterapia o inmunosupresores"
  ]

  tiene_condicion_bloqueante = condiciones_cronicas.any? do |c|
    bloqueantes_condiciones.include?(c.nombre.to_s.downcase.strip)
  end

  tiene_medicamento_bloqueante = medicamentos.any? do |m|
    bloqueantes_medicamentos.include?(m.nombre.to_s.downcase.strip)
  end

  if tiene_condicion_bloqueante || tiene_medicamento_bloqueante
    errors.add(:base, "No apto para donar sangre")
  end
end

  # -----------------------------
  # EDAD 18 - 65
  # -----------------------------
  def edad_valida
    return unless user&.fec_nacimiento.present?

    edad = Date.today.year - user.fec_nacimiento.year
    edad -= 1 if Date.today < user.fec_nacimiento + edad.years

    if edad < 18 || edad > 65
      errors.add(:base, "No apto por edad")
    end
  end

  # -----------------------------
  # FECHA DONACIÓN
  # -----------------------------
  def fecha_donacion_no_puede_ser_en_el_futuro
    if ult_donacion_fecha.present? && ult_donacion_fecha > Date.today
      errors.add(:ult_donacion_fecha, "no puede ser una fecha futura")
    end
  end

  # -----------------------------
  # LÓGICA EXISTENTE
  # -----------------------------
  def puede_donar?
    return true unless ult_donacion_fecha.present?

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
end
