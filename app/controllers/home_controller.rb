class HomeController < ApplicationController
  def index
  @ubicaciones = Ubicacion.all
  end
end
