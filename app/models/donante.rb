class Donante < ApplicationRecord
  #relaciones
  belongs_to :usuario
  has_many :donantes_condiciones
  has_many :condiciones_cronicas, through: :donantes_condiciones
  has_many :donantes_medicamentos
  has_many :medicamentos, through: :donantes_medicamentos
end
