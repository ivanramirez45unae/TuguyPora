class Donante < ApplicationRecord
  has_many :donantes_medicamentos, dependent: :destroy
  has_many :medicamentos, through: :donantes_medicamentos

  has_many :donantes_condiciones, dependent: :destroy, class_name: "DonantesCondicion"
  has_many :condiciones_cronicas, through: :donantes_condiciones, source: :condicion_cronica

  belongs_to :user
end
