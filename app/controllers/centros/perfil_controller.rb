module Centros
  class PerfilController < ApplicationController
    before_action :authenticate_user!
    before_action :verificar_centro

    def show
      @centro = current_user
      @ubicacion = @centro.ubicacion

      # Cargar horarios y días solo si existe la ubicación
      @horarios = @ubicacion.horarios.includes(:dia).order("dia_id ASC") if @ubicacion.present?
    end

    private

    def verificar_centro
      unless current_user.rol == "centro"
        redirect_to root_path, alert: "No tienes permiso para acceder a esta página."
      end
    end
  end
end
