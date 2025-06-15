class Centros::DashboardController < ApplicationController
  def index
    @postulaciones = Postulacion.all # o las que correspondan a ese centro
  end
end
