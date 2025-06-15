class DonacionesController < ApplicationController
  before_action :set_postulacion, only: [ :new, :create ]

  def new
    @postulacion = Postulacion.find(params[:postulacion_id])  # Primero encontrar la postulacion

    @donacion = @postulacion.build_donacion  # Esto funciona cuando tiene has_one :donacion
  end


  def create
    @postulacion = Postulacion.find(params[:postulacion_id])
    @donacion = Donacion.new(donacion_params)
    @donacion.donante = @postulacion.user.donante
    @donacion.solicitud = @postulacion.solicitud # si aplica

    if @donacion.save
      @postulacion.update(estado: "C")
      redirect_to @donacion, notice: "Donacion creada con éxito."
    else
      render :new, alert: "Hubo un problema al guardar la donacion."
    end
  end

  def show
    @donacion = Donacion.find(params[:id])
  end

  private

  def set_postulacion
    @postulacion = Postulacion.find(params[:postulacion_id])
  end

  def donacion_params
    params.require(:donacion).permit(
      :postulacion_id, :fecha_donacion, :volumen_ml, :tipo_sangre, :verificado_por_usuario,
      donante_attributes: [ :id, :tipo_sanguineo, :peso_kg, :estatura_cm, :tiene_tatuajes, { medicamento_ids: [], condiciones_cronica_ids: [] } ]
    )
  end
end
