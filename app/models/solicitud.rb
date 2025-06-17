class Solicitud < ApplicationRecord
  after_initialize do
    self.estado ||= "pendiente" if new_record?
  end

  belongs_to :user
  belongs_to :ubicacion, foreign_key: "location_id"
  has_many :postulaciones
  has_many :donaciones

  validates :nombre_paciente, presence: true
  validates :cin_paciente, presence: true, format: { with: /\A\d{7,8}\z/, message: "debe tener solo números y entre 7 y 8 dígitos" }
  validates :tipo_sangre, presence: true, inclusion: { in: [ "A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-" ] }
  validates :location_id, presence: true
  validates :donantes_requeridos, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :detalles, length: { maximum: 140 }, allow_blank: true
end
