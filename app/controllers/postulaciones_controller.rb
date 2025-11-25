class PostulacionesController < ApplicationController
  def new
    if current_user.donante && !current_user.donante.puede_donar?
      fecha = current_user.donante.fecha_habilitada_para_donar
      redirect_back fallback_location: users_dashboard_path,
                    flash: { alert: "No podés donar todavía. Podrás hacerlo a partir del #{I18n.l(fecha, format: :long)}." }
      return
    end

    @postulacion = Postulacion.new(ubicacion_id: params[:ubicacion_id], solicitud_id: params[:solicitud_id])
    @solicitud = Solicitud.find_by(id: params[:solicitud_id]) if params[:solicitud_id].present?
    @ubicacion = Ubicacion.find_by(id: params[:ubicacion_id]) if params[:ubicacion_id].present?
  end

  def create
    # Combinar hora y minuto en hora_tentativa
    if params[:postulacion][:hora_tentativa_hour].present? && params[:postulacion][:hora_tentativa_minute].present?
      hora = params[:postulacion].delete("hora_tentativa_hour").to_i
      minuto = params[:postulacion].delete("hora_tentativa_minute").to_i
      params[:postulacion][:hora_tentativa] = Time.new(2000, 1, 1, hora, minuto)
    end

    # Validar que la fecha no sea pasada
    if postulacion_params[:fecha_tentativa].present?
      fecha = postulacion_params[:fecha_tentativa].to_date
      if fecha < Date.today
        flash[:alert] = "La fecha tentativa no puede ser una fecha pasada."
        @postulacion = Postulacion.new(postulacion_params)
        render :new and return
      elsif fecha > Date.today + 2.years
        flash[:alert] = "La fecha tentativa no puede ser mayor a 2 años desde hoy."
        @postulacion = Postulacion.new(postulacion_params)
        render :new and return
      end
    end

    # Validar que los minutos sean múltiplos de 15
    if params[:postulacion][:hora_tentativa].present?
      minutos = params[:postulacion][:hora_tentativa].min
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
      flash[:alert] = @postulacion.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def postulacion_params
    params.require(:postulacion).permit(:ubicacion_id, :fecha_tentativa, :solicitud_id, :hora_tentativa, :hora_tentativa_hour, :hora_tentativa_minute)
  end
end
