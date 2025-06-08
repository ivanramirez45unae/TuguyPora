class PostulacionesController < ApplicationController
  def new
    @postulacion = Postulacion.new(location_id: params[:location_id])
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
    params.require(:postulacion).permit(:location_id, :fecha_tentativa, :hora_tentativa, :request_id)
  end
end
