class PostulacionesController < ApplicationController
  def new
    @postulacion = Postulacion.new(ubicacion_id: params[:ubicacion_id], solicitud_id: params[:solicitud_id])

    if params[:solicitud_id].present?
      @solicitud = Solicitud.find_by(id: params[:solicitud_id])
    end

    if params[:ubicacion_id].present?
      @ubicacion = Ubicacion.find_by(id: params[:ubicacion_id])
    end
  end

def create
  puts "USUARIO ACTUAL: #{current_user.inspect}"  # 👈 esto

  @postulacion = Postulacion.new(postulacion_params)
  @postulacion.user = current_user

  if @postulacion.save
    redirect_to root_path, notice: "Postulación creada con éxito."
  else
    puts @postulacion.errors.full_messages
    render :new
  end
end

  private

  def postulacion_params
    params.require(:postulacion).permit(:ubicacion_id, :fecha_tentativa, :hora_tentativa, :solicitud_id)
  end
end
