class VencerPostulacionesJob < ApplicationJob
  queue_as :default

  def perform
    Postulacion.where(estado: "P")
               .where("fecha_tentativa < ?", Date.today - 7.days)
               .update_all(estado: "V")
  end
end
