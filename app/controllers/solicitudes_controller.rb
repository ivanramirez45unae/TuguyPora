class SolicitudesController < ApplicationController
  before_action :authenticate_user!

  def index
    @solicitudes = Solicitud
    .left_outer_joins(:postulaciones, :donaciones)
    .select(
      "solicitudes.*",
      "COUNT(DISTINCT CASE WHEN postulaciones.estado = 'P' THEN postulaciones.id END) AS postulaciones_pendientes_count",
      "COUNT(DISTINCT donaciones.id) AS donaciones_count"
    )
    .group("solicitudes.id")
    .order("solicitudes.created_at DESC")
  end

  def new
    # Aquí puedes renderizar el formulario para crear una solicitud
    @solicitud = Solicitud.new
  end

  def create
    @solicitud = Solicitud.new(solicitud_params)
    @solicitud.user_id = current_user.id # si tienes autenticación con devise

    if @solicitud.save
      redirect_to solicitudes_path, notice: "Solicitud creada exitosamente."
    else
      render :new, status: :unprocessable_entity
    end
  end



  def destroy
    @solicitud = Solicitud.find(params[:id])
    if @solicitud.user == current_user
      @solicitud.destroy
      redirect_to solicitudes_path, notice: "Solicitud eliminada exitosamente."
    else
      redirect_to solicitudes_path, alert: "No estás autorizado para eliminar esta solicitud."
    end
  end

  def edit
    @solicitud = Solicitud.find(params[:id])
  end

  def update
    @solicitud = Solicitud.find(params[:id])
    if @solicitud.update(solicitud_params)
      redirect_to solicitudes_path, notice: "Solicitud actualizada correctamente."
    else
      render :edit
    end
  end


  private

  def solicitud_params
    params.require(:solicitud).permit(
      :nombre_paciente,
      :cin_paciente, # ojo: tu modelo tiene "cin_paciente", pero tu formulario usa "cedula_paciente"
      :tipo_sangre,
      :location_id,
      :donantes_requeridos,
      :detalles
    )
  end
end
