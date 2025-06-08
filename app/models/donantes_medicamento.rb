class DonantesMedicamento < ApplicationRecord
  belongs_to :donante
  belongs_to :medicamento
end
