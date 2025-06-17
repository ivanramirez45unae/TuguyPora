class PostulacionesController < ApplicationController
  def new
    if current_user.donante && !current_user.donante.puede_donar?
      fecha = current_user.donante.fecha_habilitada_para_donar
      redirect_back fallback_location: users_dashboard_path,
                    flash: { alert: "No podés donar todavía. Podrás hacerlo a partir del #{I18n.l(fecha, format: :long)}." }
      return
    end

    if current_user.postulaciones.where(estado: "P").count >= 3
      redirect_back fallback_location: users_dashboard_path,
                    flash: { alert: "Ya tienes 3 postulaciones pendientes. Primero espera a que sean resueltas antes de postular nuevamente." }
      return
    end

    @postulacion = Postulacion.new(ubicacion_id: params[:ubicacion_id], solicitud_id: params[:solicitud_id])

    @solicitud = Solicitud.find_by(id: params[:solicitud_id]) if params[:solicitud_id].present?
    @ubicacion = Ubicacion.find_by(id: params[:ubicacion_id]) if params[:ubicacion_id].present?
  end

  def create
    puts "USUARIO ACTUAL: #{current_user.inspect}"

    if current_user.postulaciones.where(estado: "P").count >= 3
      flash[:alert] = "Ya tienes 3 postulaciones pendientes. Primero espera a que sean resueltas antes de postular nuevamente."
      redirect_to root_path and return
    end

    # Combinar hora y minuto en hora_tentativa (string HH:MM)
    if postulacion_params[:hora_tentativa_hour].present? && postulacion_params[:hora_tentativa_minute].present?
      hora = postulacion_params[:hora_tentativa_hour].to_s.rjust(2, "0")
      minuto = postulacion_params[:hora_tentativa_minute].to_s.rjust(2, "0")
      params[:postulacion][:hora_tentativa] = "#{hora}:#{minuto}"
    end

    # Validar que la fecha no sea pasada
    if postulacion_params[:fecha_tentativa].present? && postulacion_params[:fecha_tentativa].to_date < Date.today
      flash[:alert] = "La fecha tentativa no puede ser una fecha pasada."
      @postulacion = Postulacion.new(postulacion_params)
      render :new and return
    end

    # Validar que los minutos sean múltiplos de 15
    if params[:postulacion][:hora_tentativa].present?
      minutos = params[:postulacion][:hora_tentativa].split(":")[1].to_i
      unless [ 0, 15, 30, 45 ].include?(minutos)
        flash[:alert] = "Los minutos de la hora tentativa deben ser 00, 15, 30 o 45."
        @postulacion = Postulacion.new(postulacion_params)
        render :new and return
      end
    end

    @postulacion = Postulacion.new(postulacion_params.except(:hora_tentativa_hour, :hora_tentativa_minute))
    @postulacion.user = current_user
    @postulacion.estado = "P"

    if @postulacion.save
      redirect_to root_path, notice: "Postulación creada con éxito."
    else
      puts @postulacion.errors.full_messages
      flash[:alert] = @postulacion.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def postulacion_params
    params.require(:postulacion).permit(:ubicacion_id, :fecha_tentativa, :solicitud_id, :hora_tentativa, :hora_tentativa_hour, :hora_tentativa_minute)
  end
end
