class UbicacionesController < ApplicationController
  skip_forgery_protection only: [ :search ]

  def search
    term = params[:q].to_s.strip          # convierte a string y quita espacios
    if term.empty?                        # si no hay término, devuelve nada
      @ubicaciones = Ubicacion.none
    else
      @ubicaciones = Ubicacion.where(activo: true)
                                .where("LOWER(nombre) LIKE ?", "%#{term.downcase}%")
    end

    respond_to do |format|
      format.js
    end
  end
end
