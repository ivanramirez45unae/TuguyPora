class Medicamento < ApplicationRecord
    #relaciones
    has_many :donantes_medicamentos
    has_many :donantes, through: :donantes_medicamentos
  end
end
