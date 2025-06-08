class CondicionCronica < ApplicationRecord
  has_many :donantes_condiciones, class_name: "DonantesCondicion"
  has_many :donantes, through: :donantes_condiciones

  self.table_name = "condiciones_cronicas"
end
