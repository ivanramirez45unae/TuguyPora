class DonantesCondicione < ApplicationRecord
  #relaciones
  belongs_to :donante
  belongs_to :condiciones_cronica
end
