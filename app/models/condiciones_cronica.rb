class CondicionesCronica < ApplicationRecord
  #relaciones
  has_many :donantes_condiciones
  has_many :donantes, through: :donantes_condiciones
end
