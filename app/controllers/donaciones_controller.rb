class DonacionesController < ApplicationController
  before_action :set_postulacion, only: [ :new, :create ]

  def index
    @donaciones = Donacion.all
  end

  def new
    @postulacion = Postulacion.find(params[:postulacion_id])  # Primero encontrar la postulacion

    @donacion = @postulacion.build_donacion  # Esto funciona cuando tiene has_one :donacion
  end


  def create
    @postulacion = Postulacion.find(params[:postulacion_id])
    @donacion = Donacion.new(donacion_params)
    # Asignaciones que exige el modelo
    @donacion.postulacion = @postulacion
    @donacion.user = @postulacion.user
    @donacion.ubicacion   = @postulacion.ubicacion
    @donacion.solicitud = @postulacion.solicitud
    @donacion.donante = @postulacion.user.donante

    # Extraer los arrays correctamente desde params anidados
    donante_attrs = params[:donacion][:donante_attributes] || {}

    # Actualizar datos del donante
    @donacion.donante.update(
      tipo_sanguineo: params[:tipo_sanguineo],
      peso_kg: params[:peso_kg],
      estatura_cm: params[:estatura_cm],
      tiene_tatuajes: params[:tiene_tatuajes],
      medicamento_ids: donante_attrs[:medicamento_ids],
      condiciones_cronica_ids: donante_attrs[:condiciones_cronica_ids]
    )

    if @donacion.save
      @postulacion.update(estado: "C")
      donante.update(
        ult_donacion_fecha: @donacion.fecha_donacion,
        ult_donacion_verificado: true
      )
      redirect_to @donacion, notice: "Donación registrada correctamente."
    else
      Rails.logger.debug(@donacion.errors.full_messages)
      render :new
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
    )
  end
end
