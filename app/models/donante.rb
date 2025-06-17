class Donante < ApplicationRecord
  has_many :donantes_medicamentos, dependent: :destroy
  has_many :medicamentos, through: :donantes_medicamentos

  has_many :donantes_condiciones, dependent: :destroy, class_name: "DonantesCondicion"
  has_many :condiciones_cronicas, through: :donantes_condiciones, source: :condicion_cronica

  belongs_to :user
  validates :user_id, uniqueness: true

  def puede_donar?
  return true unless ult_donacion_fecha.present?

  meses_espera = user.genero == "Femenino" ? 4 : 3
  fecha_habilitada = ult_donacion_fecha.advance(months: meses_espera)
  Date.today >= fecha_habilitada
  end

  def fecha_habilitada_para_donar
    return Date.today unless ult_donacion_fecha.present?

    meses_espera = user.genero == "Femenino" ? 4 : 3
    ult_donacion_fecha.advance(months: meses_espera)
  end
end
