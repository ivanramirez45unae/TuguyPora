class User < ApplicationRecord
  # Relaciones
  has_one :donante
  has_many :donaciones
  has_many :solicitudes
  has_many :postulaciones
  has_one :ubicacion
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.rol ||= "user"
  end

  def admin?
    rol == "admin"
  end

  def centro?
  rol == "centro"
  end
end
