class DonantesMedicamento < ApplicationRecord
  #relaciones
  belongs_to :donante
  belongs_to :medicamento
end
