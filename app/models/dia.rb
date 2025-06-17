class Dia < ApplicationRecord
  self.table_name = "dias"   # ← fuerza la tabla correcta
  has_many :horarios
end
