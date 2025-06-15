class Users::DashboardController < ApplicationController
  def index
    @ubicaciones = Ubicacion.all
    @solicitudes = Solicitud.all
  end
end
