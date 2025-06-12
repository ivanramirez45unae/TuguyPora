class HomeController < ApplicationController
  def index
  @ubicaciones = Ubicacion.all
  @solicitudes = Solicitud.all
  end
end
