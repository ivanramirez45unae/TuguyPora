class PerfilController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @donante = @user.donante
    @donaciones = Donacion.where(user_id: @user.id).order(created_at: :desc)
    @donaciones_count = @donaciones.count
    @postulaciones = Postulacion.where(user_id: @user.id)
  end
end
